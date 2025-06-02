Чтобы сохранять и отображать именно ту единицу, которую выбрал пользователь, нужно:

1. Расширить модель GlucoseEntry, чтобы в ней хранилась не только величина в ммоль/л, но и сама единица измерения.

2. В AddEntryScreen при создании новой записи отдавать в модель выбранную единицу.

3. В DashboardScreen брать из записи единицу и подставлять её в текст списка вместо жёстко прописанного 'ммоль/г'.

## 1. Модель GlucoseEntry

```dart
// файл: lib/models/glucose_entry.dart
import 'package:d_app/screens/add_entry_screen.dart'; // чтобы видеть MeasureUnit

class GlucoseEntry {
  final DateTime date;
  final double value;           // всегда храним в ммоль/л
  final MeasureUnit unit;       // единица, в которой ввёл пользователь

  GlucoseEntry({
    required this.date,
    required this.value,
    required this.unit,
  });
}
```

## 2. AddEntryScreen — сохраняем единицу

```dart
// в методе onPressed кнопки "Сохранить":
final value = double.tryParse(_glucoseController.text);
if (value == null) return;

// конвертим к ммоль/л, но хранить исходную unit
double storedValue =
    _selectedUnit == MeasureUnit.mgdl ? value / 10 : value;

final newEntry = GlucoseEntry(
  date: DateTime.now(),
  value: storedValue,
  unit: _selectedUnit!,    // передаём выбранную пользователем
);

Navigator.pop(context, newEntry);
```

## 3. DashboardScreen — отображаем единицу из записи

1. Импортируем MeasureUnit и функцию получения текста:

```dart
import 'package:d_app/screens/add_entry_screen.dart'; // MeasureUnit
```

2. Импортируем MeasureUnit и функцию получения текста:

```dart
String _unitText(MeasureUnit unit) {
  switch (unit) {
    case MeasureUnit.mmol: return 'ммоль/л';
    case MeasureUnit.mgdl: return 'мг/дл';
  }
}
```

3. Импортируем MeasureUnit и функцию получения текста:

```dart
return ListTile(
  title: Text(
    '${entry.value.toStringAsFixed(1)} ${_unitText(entry.unit)}'
  ),
  subtitle: Text(DateFormat('HH:mm').format(entry.date)),
);
```

***Итог***

Теперь каждую запись вы храните вместе с её исходной единицей, а на дашборде просто подставляете нужную строку через entry.unit. Так «Информация за сегодня» всегда будет показывать ту единицу, которую выбрал пользователь на экране добавления.