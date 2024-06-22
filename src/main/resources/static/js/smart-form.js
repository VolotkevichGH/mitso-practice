jQuery(document).ready(function($){

	jQuery.validator.addMethod("isValidPhone", function (value, element, params) {
		var telInput = $(element);

		if(!telInput.val())
			return true;

		if ($.trim(telInput.val())) {
			if(telInput.intlTelInput("isValidNumber")) {
				$(params.result).val(telInput.intlTelInput("getNumber"));
				return true;
			} else {
				return false;
			}
		}

	}, "Введите номер телефона");


	$("#smart-form").steps({
		bodyTag: "fieldset",
		headerTag: "h2",
		transitionEffect: "slideLeft",
		titleTemplate: "<span class='number'>#index#</span> #title#",
		labels: {
			finish: "Отправить",
			next: "Продолжить заполнение",
			previous: "Вернуться",
			loading: "Загрузка..." 
		},
		onStepChanging: function (event, currentIndex, newIndex){
			if (currentIndex > newIndex){return true; }
			 var form = $(this);
			 if (currentIndex < newIndex){}
			 return form.valid();
		},
		onStepChanged: function (event, currentIndex, priorIndex){
		},
		onFinishing: function (event, currentIndex){
			var form = $(this);
			form.validate().settings.ignore = ":disabled";
			return form.valid();
			//return true;
		},
		onFinished: function (event, currentIndex){
			var form = $(this);
			$("#smart-form").submit();
		}
	})
	 	.validate({
	 	errorClass: "state-error",
	 	validClass: "state-success",
	 	errorElement: "em",
	 	onkeyup: false,
	 	onclick: false,
	 	rules: {
			lastNameRus: {
				required: true
			},
			firstNameRus: {
				required: true
			},
			birthDay: {
				required: true,
				pattern: "(?:(?:0[1-9]|1[0-9]|2[0-9]).(?:0[1-9]|1[0-2])|(?:(?:30).(?!02)(?:0[1-9]|1[0-2]))|(?:31.(?:0[13578]|1[02]))).(?:19|20)[0-9]{2}",
			},
	 		sex: {
	 			required: true
	 		},
			maritalStatus: {
				required: true
			},
			email: {
				required: true,
				email: true
			},
			 phoneUtils: {
			   	required: true,
			  	 isValidPhone: {
			   		result: "#phoneResult"
			  	 },
			 },
			typeDoc: {
				required: true
			},
			serialDoc: {
				required: true
			},
			numberDoc: {
				required: true,
				number: true
			},
			docOnDate: {
				required: true,
			 pattern: "(?:(?:0[1-9]|1[0-9]|2[0-9]).(?:0[1-9]|1[0-2])|(?:(?:30).(?!02)(?:0[1-9]|1[0-2]))|(?:31.(?:0[13578]|1[02]))).(?:19|20)[0-9]{2}",
			},
			docOffDate: {
				required: true,
			 pattern: "(?:(?:0[1-9]|1[0-9]|2[0-9]).(?:0[1-9]|1[0-2])|(?:(?:30).(?!02)(?:0[1-9]|1[0-2]))|(?:31.(?:0[13578]|1[02]))).(?:19|20)[0-9]{2}",
			},
			docIssuedBy: {
	 			required: true,
	 		},
			lastNameBlr: {
				required: true,
			},
			firstNameBlr: {
				required: true,
			},
			lastNameLat: {
				required: true,
			},
			firstNameLat: {
				required: true,
			},
			registrationTypeStreet: {
				required: true,
			},
			registrationStreetName: {
				required: true,
			},
			registrationBuildingNumber: {
				required: true,
			},
			typeEducation: {
				required: true,
			},
			yearEducation: {
				required: true,
			},
			typeSchool: {
				required: true,
			},
			villageSchool: {
				required: true,
			},
			fullNameSchool: {
				required: true,
			},
			docEduNumber: {
				required: true,
			},
			docEduDate: {
				required: true,
			 pattern: "(?:(?:0[1-9]|1[0-9]|2[0-9]).(?:0[1-9]|1[0-2])|(?:(?:30).(?!02)(?:0[1-9]|1[0-2]))|(?:31.(?:0[13578]|1[02]))).(?:19|20)[0-9]{2}",
			},
			docEduPoint: {
				required: true,
				number: true
			},
			workExperienceYears: {
				number: true
			},
			workExperienceMonths: {
				number: true
			},
			foreignLanguageCode: {
				number: true
			},
			stateLanguageCode: {
				number: true
			},
			historyCode: {
				number: true
			},
			foreignLanguagePoint: {
				number: true
			},
			stateLanguagePoint: {
				number: true
			},
			historyPoint: {
				number: true
			},
			faculty: {
				required: true,
			},
			eduForm: {
				required: true,
			},
			eduContract: {
				required: true,
			},
			eduPeriod: {
				required: true,
			},
			specialty: {
				required: true,
			},

			 phoneMUtils: {
			  	isValidPhone: {
			  		result: "#phoneResultM"
				},
			 },
			 phoneFUtils: {
			  	isValidPhone: {
			  		result: "#phoneResultF"
			  	},
			 },
			legalRepresentative: {
				required: true,
			},
			docTypeLegal: {
			},
			docSeriesLegal: {
			},
			docNumberLegal: {
			 number:true
			},
			docOnDateLegal: {
			 pattern: "(?:(?:0[1-9]|1[0-9]|2[0-9]).(?:0[1-9]|1[0-2])|(?:(?:30).(?!02)(?:0[1-9]|1[0-2]))|(?:31.(?:0[13578]|1[02]))).(?:19|20)[0-9]{2}",
			},
			docOffDateLegal: {
			 pattern: "(?:(?:0[1-9]|1[0-9]|2[0-9]).(?:0[1-9]|1[0-2])|(?:(?:30).(?!02)(?:0[1-9]|1[0-2]))|(?:31.(?:0[13578]|1[02]))).(?:19|20)[0-9]{2}",
			},
			docIssuedByLegal: {
			},
	 	},
	 	messages: {
	 		lastNameRus: {
	 			required: "Введите фамилию",
	 		},
	 		firstNameRus: {
	 			required: "Введите имя",
	 		},
			birthDay: {
	 			required: "Введите дату рождения",
				pattern: "Неправильный формат даты"
	 		},
	 		sex: {
	 			required: "Выберите из списка"
	 		},
			maritalStatus: {
				required: "Выберите из списка"
			},
	 		emailAddress: {
	 			required: 'Веведите Ваш e-mail',
	 			email: 'Проверьте правильность введенных данных (e-mail)'
	 		},
			phoneUtils: {
	 		   	required: 'Введите номер мобильного телефона',
			 	 isValidPhone: 'Введите номер мобильного телефона согласно Вашему региону'
	 		   },
			typeDoc: {
				required: "Выберите из списка"
			},
			serialDoc: {
				required: "Введите серию документа"
			},
			numberDoc: {
				required: "Введите номер документа",
				number: 'Номер должен состоять из цифр без пробелов'
			},
			docOnDate: {
				required: "Введите дату выдачи документа",
			 pattern: "Неправильный формат даты"
			},
			docOffDate: {
				required: "Введите дату окончания действия документа",
			 pattern: "Неправильный формат даты"
			},
			docIssuedBy: {
				required: "Введите название учреждения, выдавшего документ"
			},
			lastNameBlr: {
				required: "Введите фамилию на белорусском языке"
			},
			firstNameBlr: {
				required: "Введите имя на белорусском языке"
			},
			lastNameLat: {
				required: "Введите фамилию на латинице"
			},
			firstNameLat: {
				required: "Введите имя на латинице"
			},
			registrationTypeStreet: {
				required: "Выберите из списка"
			},
			registrationStreetName: {
				required: "Введите название улицы"
			},
			registrationBuildingNumber: {
				required: "Введите номер дома"
			},
			typeEducation: {
				required: "Выберите из списка"
			},
			yearEducation: {
				required: "Выберите из списка"
			},
			typeSchool: {
				required: "Выберите из списка"
			},
			villageSchool: {
				required: "Выберите один из вариантов"
			},
			fullNameSchool: {
				required: "Введите полное название учебного заведения"
			},
			docEduNumber: {
				required: "Введите номер документа об образовании"
			},
			docEduDate: {
				required: "Введите дату выдачи документа",
			 pattern: "Неправильный формат даты"
			},
			docEduPoint: {
				required: "Введите средний балл документа об образовании",
				number: 'Балл должен состоять из цифр без пробелов от 10 до 100'
			},
			workExperienceYears: {
				number: 'Номер должен состоять из цифр без пробелов'
			},
			workExperienceMonths: {
				number: 'Номер должен состоять из цифр без пробелов'
			},
			foreignLanguageCode: {
				number: 'Номер должен состоять из цифр без пробелов'
			},
			stateLanguageCode: {
				number: 'Номер должен состоять из цифр без пробелов'
			},
			historyCode: {
				number: 'Номер должен состоять из цифр без пробелов'
			},
			foreignLanguagePoint: {
				number: 'Номер должен состоять из цифр без пробелов'
			},
			stateLanguagePoint: {
				number: 'Номер должен состоять из цифр без пробелов'
			},
			historyPoint: {
				number: 'Номер должен состоять из цифр без пробелов'
			},
			faculty: {
				required: "Выберите из списка"
			},
			eduForm: {
				required: "Выберите из списка"
			},
			eduContract: {
				required: "Выберите из списка"
			},
			eduPeriod: {
				required: "Выберите из списка"
			},
			specialty: {
				required: "Выберите из списка"
			},
			 phoneMUtils: {
			 	isValidPhone: 'Введите номер мобильного телефона согласно Вашему региону'
			 },
			 phoneFUtils: {
			 	isValidPhone: 'Введите номер мобильного телефона согласно Вашему региону'
			 },
			legalRepresentative: {
				required: "Выберите один из вариантов"
			},
			docTypeLegal: {

			},
			docSeriesLegal: {

			},
			docNumberLegal: {
				number: 'Номер должен состоять из цифр без пробелов'
			},
			docOnDateLegal: {
			 pattern: "Неправильный формат даты"
			},
			docOffDateLegal: {
			 pattern: "Неправильный формат даты"
			},
			docIssuedByLegal: {
			},
	 	},
	 	highlight: function(element, errorClass, validClass) {
	 		$(element).closest('.field').addClass(errorClass).removeClass(validClass);
	 	},
	 	unhighlight: function(element, errorClass, validClass) {
	 		$(element).closest('.field').removeClass(errorClass).addClass(validClass);
	 	},
	 	errorPlacement: function(error, element) {
	 		if (element.is(":radio") || element.is(":checkbox")) {
	 			element.closest('.option-group').after(error);
	 		} else {
	 			error.insertAfter(element.parent());
	 		}
	 	}
	 });

	/* Document validation start
	--------------------------------------- */
	$("#dateOnDoc").datepicker({
		regional: 'ru',
		numberOfMonths: 1,
		prevText: '<i class="fa fa-chevron-left"></i>',
		nextText: '<i class="fa fa-chevron-right"></i>',
		showButtonPanel: false,				
		dateFormat:"dd.mm.yy",
		//pattern: "(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))",
		maxDate: '0',
		changeMonth: true,
		changeYear: true,
		onClose: function( selectedDate ) {
			$( "#dateOffDoc" ).datepicker( "option", "minDate", selectedDate );
		}
	});

	$("#dateOffDoc").datepicker({
		regional: 'ru',
		numberOfMonths: 1,
		prevText: '<i class="fa fa-chevron-left"></i>',
		nextText: '<i class="fa fa-chevron-right"></i>',
		showButtonPanel: false,		
		dateFormat:"dd.mm.yy",
		minDate: '0',
		changeMonth: true,
		changeYear: true,
		onClose: function( selectedDate ) {
			$( "#dateOnDoc" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
	
	$("#docEduDate").datepicker({
		regional: 'ru',
		numberOfMonths: 1,
		prevText: '<i class="fa fa-chevron-left"></i>',
		nextText: '<i class="fa fa-chevron-right"></i>',
		showButtonPanel: false,		
		dateFormat:"dd.mm.yy",
		maxDate: '0',
		changeMonth: true,
		changeYear: true,
	});

	$("#docOnDateLegal").datepicker({
		regional: 'ru',
		numberOfMonths: 1,
		prevText: '<i class="fa fa-chevron-left"></i>',
		nextText: '<i class="fa fa-chevron-right"></i>',
		showButtonPanel: false,
		dateFormat:"dd.mm.yy",
		maxDate: '0',
		changeMonth: true,
		changeYear: true,
		onClose: function( selectedDate ) {
			$( "#docOffDateLegal" ).datepicker( "option", "minDate", selectedDate );
		}
	});

	$("#docOffDateLegal").datepicker({
		regional: 'ru',
		numberOfMonths: 1,
		prevText: '<i class="fa fa-chevron-left"></i>',
		nextText: '<i class="fa fa-chevron-right"></i>',
		showButtonPanel: false,
		dateFormat:"dd.mm.yy",
		minDate: '0',
		changeMonth: true,
		changeYear: true,
		onClose: function( selectedDate ) {
			$( "#docOnDateLegal" ).datepicker( "option", "maxDate", selectedDate );
		}
	});

	/* Document validation end
	--------------------------------------- */
	
	$("#birthDay").datepicker({
		regional: 'ru',
		numberOfMonths: 1,
		prevText: '<i class="fa fa-chevron-left"></i>',
		nextText: '<i class="fa fa-chevron-right"></i>',
		showButtonPanel: false,		
		dateFormat: "dd.mm.yy",
		maxDate: '-16y',
		minDate: '-60y',
		changeMonth: true,
		changeYear: true,
	});


	$('#foreignCheck').change(function(){
		if(this.checked) {
			$('.foreign-block').fadeIn('fast');
			$('.blrus-block').fadeOut('fast');
		}
		else {
			$('.blrus-block').fadeIn('fast');
			$('.foreign-block').fadeOut('fast');
		}
	});

	$('#target').change(function(){
		if(this.checked) {
			$('.target-block').fadeIn('fast');
		}
		else {
			$('.target-block').fadeOut('fast');
		}
	});

	$('#nameSpecialty').change(function(){
		if($(this).val() != "") {
			$('.hasSpecialty-block').fadeIn('fast');
		}
		else {
			$('.hasSpecialty-block').fadeOut('fast');
		}
	});

	/*
	--------------------------------------------
	PHONE VALIDATION START
	-------------------------------------------- */

	$("#phoneUtils").intlTelInput({
		separateDialCode:true,
		hiddenInput: "full",
		preferredCountries: ["by", "ru", "ua"],
		utilsScript: "js/utils.js"
	});

	$("#phoneMUtils").intlTelInput({
		separateDialCode:true,
		preferredCountries: ["by", "ru", "ua"],
		utilsScript: "js/utils.js"
	});

	$("#phoneFUtils").intlTelInput({
		separateDialCode:true,
		preferredCountries: ["by", "ru", "ua"],
		utilsScript: "js/utils.js"
	});

	/*
	--------------------------------------------
	PHONE VALIDATION END
	-------------------------------------------- */


	$(".address-basic").select2();

	$("#areaReg").remoteChained({
		parents : "#countryReg",
		url : "/area",
		loading : "Загрузка..."
	});

	$("#districtReg").remoteChained({
		parents : "#areaReg",
		url : "/district",
		loading : "Загрузка..."
	});

	$("#nameCityReg").remoteChained({
		parents : ["#areaReg", "#districtReg", "#typeLocalityReg"],
		url : "/locality",
		loading : "Загрузка..."
	});






	$("#eduForm").remoteChained({
		parents : "#faculty",
		url : "/eduForm",
		loading : "Загрузка..."
	});

	$("#eduContract").remoteChained({
		parents : ["#faculty", "#eduForm"],
		url : "/eduContract",
		loading : "Загрузка..."
	});

	$("#eduPeriod").remoteChained({
		parents : ["#faculty", "#eduForm", "#eduContract"],
		url : "/eduPeriod",
		loading : "Загрузка..."
	});

	$("#specialty").remoteChained({
		parents : ["#faculty", "#eduForm", "#eduContract", "#eduPeriod"],
		url : "/specialty",
		loading : "Загрузка..."
	});



	//$('#areaReg option[value=""]').attr(disabled,true);

	/*
	--------------------------------------------
	PHONE VALIDATION END
	-------------------------------------------- */




	var mapKeyEngToRus = {'q' : 'й', 'w' : 'ц', 'e' : 'у', 'r' : 'к', 't' : 'е', 'y' : 'н', 'u' : 'г', 'i' : 'ш', 'o' : 'щ', 'p' : 'з', '[' : 'х', ']' : 'ъ', 'a' : 'ф', 's' : 'ы', 'd' : 'в', 'f' : 'а', 'g' : 'п', 'h' : 'р', 'j' : 'о', 'k' : 'л', 'l' : 'д', ';' : 'ж', '\'' : 'э', 'z' : 'я', 'x' : 'ч', 'c' : 'с', 'v' : 'м', 'b' : 'и', 'n' : 'т', 'm' : 'ь', ',' : 'б', '.' : 'ю','Q' : 'Й', 'W' : 'Ц', 'E' : 'У', 'R' : 'К', 'T' : 'Е', 'Y' : 'Н', 'U' : 'Г', 'I' : 'Ш', 'O' : 'Щ', 'P' : 'З', '[' : 'Х', ']' : 'Ъ', 'A' : 'Ф', 'S' : 'Ы', 'D' : 'В', 'F' : 'А', 'G' : 'П', 'H' : 'Р', 'J' : 'О', 'K' : 'Л', 'L' : 'Д', ';' : 'Ж', '\'' : 'Э', 'Z' : 'Я', 'X' : 'Ч', 'C' : 'С', 'V' : 'М', 'B' : 'И', 'N' : 'Т', 'M' : 'Ь', '<' : 'Б', '>' : 'Ю'};
	var mapKeyRusToEng = {'й' : 'q', 'ц' : 'w', 'у' : 'e', 'к' : 'r', 'е' : 't', 'н' : 'y', 'г' : 'u', 'ш' : 'i', 'щ' : 'o', 'з' : 'p', 'х' : '[', 'ъ' : ']', 'ф' : 'a', 'ы' : 's', 'в' : 'd', 'а' : 'f', 'п' : 'g', 'р' : 'h', 'о' : 'j', 'л' : 'k', 'д' : 'l', 'ж' : ';', 'э' : '\'', 'я' : 'z', 'ч' : 'x', 'с' : 'c', 'м' : 'v', 'и' : 'b', 'т' : 'n', 'ь' : 'm', 'б' : ',', 'ю' : '.','Й' : 'Q', 'Ц' : 'W', 'У' : 'E', 'К' : 'R', 'Е' : 'T', 'Н' : 'Y', 'Г' : 'U', 'Ш' : 'I', 'Щ' : 'O', 'З' : 'P', 'Х' : '[', 'Ъ' : ']', 'Ф' : 'A', 'Ы' : 'S', 'В' : 'D', 'А' : 'F', 'П' : 'G', 'Р' : 'H', 'О' : 'J', 'Л' : 'K', 'Д' : 'L', 'Ж' : ';', 'Э' : '\'', 'Я' : 'Z', 'Ч' : 'X', 'С' : 'C', 'М' : 'V', 'И' : 'B', 'Т' : 'N', 'Ь' : 'M', 'Б' : '<', 'Ю' : '>'};
	var mapKeyRusToBlr = {'щ' : 'ў', 'ъ' : '\'', 'и' : 'і', 'И' : 'I'}


	$("#docSeries").on('keyup', function () {
		var str = $(this).val();
		var r = '';
		for (var i = 0; i < str.length; i++)
		{
			r += mapKeyRusToEng[str.charAt(i)] || str.charAt(i);
		}
		$(this).val(r);
	});

	$("#docSeriesLegal").on('keyup', function () {
		var str = $(this).val();
		var r = '';
		for (var i = 0; i < str.length; i++)
		{
			r += mapKeyRusToEng[str.charAt(i)] || str.charAt(i);
		}
		$(this).val(r);
	});

	$("#personalNumber").on('keyup', function () {
		var str = $(this).val();
		var r = '';
		for (var i = 0; i < str.length; i++)
		{
			r += mapKeyRusToEng[str.charAt(i)] || str.charAt(i);
		}
		$(this).val(r);
	});

	$("#personalNumberLegal").on('keyup', function () {
		var str = $(this).val();
		var r = '';
		for (var i = 0; i < str.length; i++)
		{
			r += mapKeyRusToEng[str.charAt(i)] || str.charAt(i);
		}
		$(this).val(r);
	});

	$("#lastNameBlr").on('keyup', function () {
		var str = $(this).val();
		var r = '';
		for (var i = 0; i < str.length; i++)
		{
			r += mapKeyRusToBlr[str.charAt(i)] || str.charAt(i);
		}
		$(this).val(r);
	});

	$("#firstNameBlr").on('keyup', function () {
		var str = $(this).val();
		var r = '';
		for (var i = 0; i < str.length; i++)
		{
			r += mapKeyRusToBlr[str.charAt(i)] || str.charAt(i);
		}
		$(this).val(r);
	});

	$("#middleNameBlr").on('keyup', function () {
		var str = $(this).val();
		var r = '';
		for (var i = 0; i < str.length; i++)
		{
			r += mapKeyRusToBlr[str.charAt(i)] || str.charAt(i);
		}
		$(this).val(r);
	});


	$("#lastNameLat").on('keyup', function () {
		var str = $(this).val();
		var r = '';
		for (var i = 0; i < str.length; i++)
		{
			r += mapKeyRusToEng[str.charAt(i)] || str.charAt(i);
		}
		$(this).val(r);
	});

	$("#firstNameLat").on('keyup', function () {
		var str = $(this).val();
		var r = '';
		for (var i = 0; i < str.length; i++)
		{
			r += mapKeyRusToEng[str.charAt(i)] || str.charAt(i);
		}
		$(this).val(r);
	});








	$('.latinoUP').keyup(function() {
		$(this).val($(this).val().toUpperCase());
	});







	$("#login").validate({
		errorClass: "state-error",
		validClass: "state-success",
		errorElement: "em",
		onkeyup: false,
		onclick: false,
		rules: {
			email: {
				required: true,
				email: true,
				pattern: "[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}",
				maxlength: 50
			},

			password: {
				required: true,
				minlength: 8,
				maxlength: 30,
			},
		},
		messages: {
			email: {
				required: "Веведите Ваш адрес электронной почты",
				email: "Проверьте правильность введенных данных (e-mail)",
				pattern: "Проверьте правильность введенных данных (e-mail)!",
				maxlength: "Проверьте правильность введенных данных (e-mail)",
			},
			password: {
				required: "Веведите Ваш пароль",
				minlength: "Пароль должен содержать не менее 8 символов",
				maxlength: "Проверьте правильность введенных данных",
			},
		},
		highlight: function (element, errorClass, validClass) {
			$(element).closest('.field').addClass(errorClass).removeClass(validClass);
		},
		unhighlight: function (element, errorClass, validClass) {
			$(element).closest('.field').removeClass(errorClass).addClass(validClass);
		},
		errorPlacement: function (error, element) {
			if (element.is(":radio") || element.is(":checkbox")) {
				element.closest('.option-group').after(error);
			} else {
				error.insertAfter(element.parent());
			}
		}
	});

	$("#registration").validate({
		errorClass: "state-error",
		validClass: "state-success",
		errorElement: "em",
		onkeyup: false,
		onclick: false,
		rules: {
			email: {
				required: true,
				email: true,
				pattern: "[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}",
				maxlength: 50
			},

			password: {
				required: true,
				minlength: 8,
				maxlength: 30
			},
			passwordConfirmation: {
				required: true,
				minlength: 8,
				maxlength: 30,
				equalTo: "#password"
			},
			docType: {
				required: true,
			},
			docSeries: {
				required: true,
				maxlength: 8,
			},
			docNumber: {
				required: true,
				number: true,
				maxlength: 10,
			},
		},
		messages: {
			email: {
				required: "Веведите Ваш адрес электронной почты",
				email: "Проверьте правильность введенных данных (e-mail)",
				pattern: "Проверьте правильность введенных данных (e-mail)!",
				maxlength: "Проверьте правильность введенных данных (e-mail)",
			},
			password: {
				required: "Веведите Ваш пароль",
				minlength: "Пароль должен содержать не менее 8 символов",
				maxlength: "Проверьте правильность введенных данных",
			},
			passwordConfirmation: {
				required: "Веведите подтверждение пароля",
				minlength: "Пароль должен содержать не менее 8 символов",
				maxlength: "Проверьте правильность введенных данных",
				equalTo: "Проверьте правильность введенных данных",
			},
			docType: {
				required: "Выберите тип документа, удостоверяющего личность",
			},
			docSeries: {
				required: "Веведите серию документа, удостоверяющего личность",
				maxlength: "Проверьте правильность введенных данных",
			},
			docNumber: {
				required: "Веведите номер документа, удостоверяющего личность",
				number: "Номер документа, удостоверяющего личность, состоит из цифр без пробелов",
				maxlength: "Проверьте правильность введенных данных",
			},


		},
		highlight: function(element, errorClass, validClass) {
			$(element).closest('.field').addClass(errorClass).removeClass(validClass);
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).closest('.field').removeClass(errorClass).addClass(validClass);
		},
		errorPlacement: function(error, element) {
			if (element.is(":radio") || element.is(":checkbox")) {
				element.closest('.option-group').after(error);
			} else {
				error.insertAfter(element.parent());
			}
		}

	});

	$("#typeCompetitionAndCaseNumber").validate({
		errorClass: "state-error",
		validClass: "state-success",
		errorElement: "em",
		onkeyup: false,
		onclick: false,
		rules: {
			typeCompetition: {
				required: true,
			},

			caseNumber: {
				required: true,
				number: true,
				maxlength: 4
			},
		},
		messages: {
			typeCompetition: {
				required: "Выберите вид конкурса",
			},

			caseNumber: {
				required: "Веведите номер документа, удостоверяющего личность",
				number: "Номер документа, удостоверяющего личность, состоит из цифр без пробелов",
				maxlength: "Проверьте правильность введенных данных",
			},
		},
		highlight: function(element, errorClass, validClass) {
			$(element).closest('.field').addClass(errorClass).removeClass(validClass);
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).closest('.field').removeClass(errorClass).addClass(validClass);
		},
		errorPlacement: function(error, element) {
			if (element.is(":radio") || element.is(":checkbox")) {
				element.closest('.option-group').after(error);
			} else {
				error.insertAfter(element.parent());
			}
		}

	});

	$('input[type=file]').change(function() {
		//$smartFileVal = $(this);
		$(this).next('.gui-input').val($(this).val().split('/').pop().split('\\').pop());
	});

	$('[data-smartmodal-close]').on('click', function(e)  {
		e.preventDefault();
		var smartInactiveModal = $(this).attr('data-smartmodal-close');
		$(smartInactiveModal).removeClass('smartforms-modal-visible');
		$('body').removeClass('smartforms-modal-scroll');
	});

});