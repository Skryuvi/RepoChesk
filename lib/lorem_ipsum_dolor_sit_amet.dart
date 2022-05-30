class MainScreenListItem{
  final String name;
  final List<MainScreenListSubItem> subList;
  MainScreenListItem(this.name, this.subList);
}
class MainScreenListSubItem{
  final String ls;
  final String pu;
  final String subName;
  var checked = false;
  MainScreenListSubItem(this.ls, this.pu, this.subName, this.checked);
}

final actsList = {
  9: "Акт о возобновлении подачи электроэнергии",
  1: "Анкета потребителя",
  2: "Акт проверки узла учета электрической энергии",
  3: "Акт о выявлении несанкционированного подключения",
  4: "Акт о несанкционированном вмешательстве в работу прибора учета",
  5: "Акт об отказе в допуске к прибору учета",
  6: "Акт ввода прибора учёта в эксплуатацию",
  7: "Внесение показаний по прибору учета",
  8: "Акт замены/установки прибора учета электроэнергии",
};

// типы приборов учета
final List<String> puTypes = [
  "Меркурий 234 ARTM",
  "Меркурий 234 ARTM с функциями телемеханики (трехфазный)",
  "Меркурий 208 (однофазный)",
  "СЭТ-4ТМ.03М.01",
  "УСПД RTU-525",
  "NP73E.1-10-1 (FSK-132)",
  "ЦЭ2726А",
];

// состояния прибора учета
final List<String> puStates = [
  "соответствует",
  "не соответствует",
  "не исправен",
  "отсутствует",
  "пломба отсутствует",
  "пломба нарушена",
  "безучетное потребление"
];

// причины не снятия показаний прибора учета
final List<String> puStateRejectReasons = [
  "не соответствует ПУ",
  "не исправен ПУ",
  "отсутствует ПУ",
  "нет доступа к ПУ (загромождение)",
  "недопуск в помещение хозяином",
  "злая собака"
];

// механические повреждения ПУ
final List<String> mechanicalDamageValues = ['Отсутствуют', 'Присутствуют'];
// Признаки вмешательства в работу ПУ и безучетного потребления
final List<String> unmeteredConsumptionValues = ['Отсутствуют', 'Присутствуют'];
// Отверстия, трещины в корпусе ПУ
final List<String> holesExistValues = ['Отсутствуют', 'Присутствуют'];
// Прилегание стекла индикатора
final List<String> fittingIndicatorGlassValues = ['Плотное', 'Не плотное'];
// Нарушение пломб
final List<String> stampDamageValues = ['Отсутствуют', 'Присутствуют'];
// Свободный доступ к элементам коммутации
final List<String> switchingElementsFreeAccessValues = ['Отсутствует', 'Присутствует'];
// Прибор учета электрической энергии считается Исправным или Вышедшим из строя
final List<String> serviceabilityPuValues = ['Исправным', 'Вышедшим из строя'];


List<MainScreenListItem> locationsLorem = [
  MainScreenListItem('Ленина улица', subFirst),
  MainScreenListItem('Пушкина улица', subSecond),
  MainScreenListItem('Ставропольская улица', subThird),
  MainScreenListItem('Южная улица', subFourth)
];
List<MainScreenListSubItem> subFirst = [
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Ленина 334, кв. 24',false),
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Ленина 334, кв. 24',false),
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Ленина 334, кв. 24',false),
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Ленина 334, кв. 24',false),

];
List<MainScreenListSubItem> subSecond = [
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Пушкина 334, кв. 24',false),
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Пушкина 334, кв. 24',false),
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Пушкина 334, кв. 24',false)
];
List<MainScreenListSubItem> subThird = [
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Ставропольская 334, кв. 24',false),
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Ставропольская 334, кв. 24',false),
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Ставропольская 334, кв. 24',false)
];
List<MainScreenListSubItem> subFourth = [
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Южная 334, кв. 24',false),
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Южная 334, кв. 24',false),
  MainScreenListSubItem('ЛС 123-456-12312', 'ПУ: 463123-123456', 'ул. Южная 334, кв. 24',false)
];