package com.mslu.applicant.entity;

import com.mslu.applicant.entity.references.TypeDocument;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Collection;
import java.util.Set;

@Setter
@Getter
@Entity
@Table(name = "usr")
public class User implements UserDetails{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private boolean active;

    @NotBlank(message = "Введите Ваш адрес электронной почты!")
    @Email(message = "Значение email не соответствует шаблону")
    private String email;

    @NotBlank(message = "Введите Ваш пароль")
    private String password;

//    @Transient
//    @NotBlank(message = "Введите Ваш пароль")
//    private String passwordConfirmation;

    @OneToOne
    @JoinColumn(name = "doc_type", referencedColumnName = "id")
    @NotNull(message = "Выберите один из вариантов типа документа")
    private TypeDocument docType;

    @NotBlank(message = "Атрибут документа не может быть пустым")
    private String docSeries;

    @NotBlank(message = "Атрибут документа не может быть пустым")
    private String docNumber;

    private String activationCode;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }

}
