
Процедура ОбработкаПроведения(Отказ, Режим)
	// регистр Данные Вылетов
	Движения.ДанныеВылетов.Записывать = Истина;
	Движение = Движения.ДанныеВылетов.Добавить();
	Движение.Период = Дата;
	Движение.Рейс = Рейс;
	Движение.Дата = Дата(Дата);
	Движение.ПассажирыВзрослые = ПассажирыВзрослые;
	Движение.ПассажирыДети = ПассажирыДети;
	Движение.ПассажирыМалыши = ПассажирыМалыши;
	Движение.РучнаяКладь = РучнаяКладь;
	Движение.Багаж = Багаж;
	Движение.Почта = Почта;
	Движение.Груз = Груз;
	Движение.НомерБорта = НомерБорта;
	Движение.ОтправлениеПлан = ОтправлениеПлан;
	Движение.НачалоРуления = НачалоРуления;
	Движение.ВремяВзлета = ВремяВзлета;
	Движение.ПрибытиеВКП = ПрибытиеВКП;
	Движение.Регулярность = Регулярность;
	Движение.Примечание = Примечание;
	Движение.VIPПассажирыВзрослые = VIPПассажирыВзрослые;
	Движение.VIPПассажирыДети = VIPПассажирыДети;
	Движение.ТипВС = ТипВС;
	Движение.АрктикаТ1 = АрктикаТ1;
	Движение.АрктикаТ4 = АрктикаТ4;
	Движение.ЗаправленоТС = ЗаправленоТС;
	Движение.АэропортПрилета = АэропортПрилета;
	Движение.АэропортВылета = АэропортВылета;
	Движение.ЗадержкаВылета = ЗадержкаВылета;
	Движение.ПричинаЗадержки = ПричинаЗадержки;
	Движение.ОтменаВылета = ОтменаВылета;
	Движение.ПричинаНевылета = ПричинаНевылета;
	Движение.ЗавершениеОбслуживания = ЗавершениеОбслуживания;
	
	//регистр Количество кресел бортов
	Запрос = Новый Запрос;

	Запрос.Текст = 
		"ВЫБРАТЬ
		|	КоличествоКреселБортовСрезПоследних.КоличествоКресел КАК КоличествоКресел
		|ИЗ
		|	РегистрСведений.КоличествоКреселБортов.СрезПоследних(&Дата, НомерБорта = &НомерБорта) КАК КоличествоКреселБортовСрезПоследних";
	
	Запрос.УстановитьПараметр("Дата", Дата);
	Запрос.УстановитьПараметр("НомерБорта", НомерБорта);
	
	Результат = Запрос.Выполнить();
	
	Если Результат.Пустой() Тогда
		МенеджерЗаписи = РегистрыСведений.КоличествоКреселБортов.СоздатьМенеджерЗаписи(); 
		МенеджерЗаписи.Период = Дата; 
		МенеджерЗаписи.НомерБорта = НомерБорта; 
		МенеджерЗаписи.КоличествоКресел = КоличествоКресел; 
		МенеджерЗаписи.Записать(); 		
	Иначе
		Результат = Запрос.Выполнить().Выбрать();	
		Результат.Следующий();
		Если КоличествоКресел <> Результат.КоличествоКресел Тогда  
			МенеджерЗаписи = РегистрыСведений.КоличествоКреселБортов.СоздатьМенеджерЗаписи(); 
			МенеджерЗаписи.Период = Дата; 
			МенеджерЗаписи.НомерБорта = НомерБорта; 
			МенеджерЗаписи.КоличествоКресел = КоличествоКресел; 
			МенеджерЗаписи.Записать();	 		
		КонецЕсли;
	КонецЕсли; 
	
	
КонецПроцедуры
