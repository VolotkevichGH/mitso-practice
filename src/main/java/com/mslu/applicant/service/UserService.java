package com.mslu.applicant.service;

import com.mslu.applicant.entity.Role;
import com.mslu.applicant.entity.User;
import com.mslu.applicant.entity.references.TypeDocument;
import com.mslu.applicant.repos.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.mail.MessagingException;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService {

    private final UserRepository userRepository;

    private final MailSender mailSender;

    private final PasswordEncoder passwordEncoder;

    @Value("${hostname}")
    private String hostname;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(username);

        if(user == null) {
            throw new UsernameNotFoundException("Пользователь не найден!");
        }

        return user;
    }

    public boolean isValidUser(TypeDocument document, String serial, String number, String email) {

        User user = userRepository.findByDocTypeAndDocSeriesAndDocNumberOrEmail(document,serial,number,email);

        if(user != null)
            return true;

        return false;
    }

    public boolean addUser(User user) throws MessagingException {

        User userFromDb = userRepository.findByDocTypeAndDocSeriesAndDocNumberOrEmail(user.getDocType(),user.getDocSeries().toUpperCase().trim(),user.getDocNumber().trim(),user.getEmail());

        if(userFromDb != null) {
            return false;
        }

        user.setActive(false);
        user.setDocSeries(user.getDocSeries().toUpperCase().trim());
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepository.save(user);

        sendMessage(user);

        return true;

    }

    private void sendMessage(User user) throws MessagingException {
        if(!StringUtils.isEmpty(user.getEmail())) {

            String message = String.format(
                    "Добро пожаловать в личный кабинет абитуриента МГЛУ! \n"+
                            "Для полноценного использования кабинета и подтверждения Вашего почтового ящика перейдите по следующей ссылке: http://%s/activate/%s",
                    hostname,
                    user.getActivationCode()
            );

            mailSender.sendMsg(user.getEmail(),"Активация личного кабинета Абитуриента МГЛУ", message);
        }
    }

    public boolean activateUser(String code) {
        User user = userRepository.findByActivationCode(code);

        if(user == null) {
            return false;
        }

        user.setActivationCode(null);
        user.setActive(true);
        userRepository.save(user);

        return true;
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public void saveUser(User user, String email, Map<String, String> form) {
        user.setEmail(email);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        for(String key : form.keySet()) {
            if(roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }
}
