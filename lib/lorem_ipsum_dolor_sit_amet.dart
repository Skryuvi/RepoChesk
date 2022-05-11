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
final List<String> actsList = [
  "Акт о возобновлении подачи электроэнергии",
  "Анкета потребителя",
  "Акт проверки узла учета электрической энергии",
  "Акт о выявлении несанкционированного подключения",
  "Акт о несанкционированном вмешательстве в работу прибора учета",
  "Акт об отказе в допуске к прибору учета",
  "Акт ввода прибора учёта в эксплуатацию",
  "Внесение показаний по прибору учета",
  "Акт замены/установки прибора учета электроэнергии",
];

final List<String> puStates = [
  "соответствует",
  "не соответствует",
  "не исправен",
  "отсутствует",
  "пломба отсутствует",
  "пломба нарушена",
  "безучетное потребление"
];

final List<String> puStateRejectReasons = [
  "не соответствует ПУ",
  "не исправен ПУ",
  "отсутствует ПУ",
  "нет доступа к ПУ (загромождение)",
  "недопуск в помещение хозяином",
  "злая собака"
];

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