import 'package:flutter/material.dart';

class DiabetesInfoScreen extends StatelessWidget {
  const DiabetesInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Раздел для Типа 1
          Text(
            'Диабет 1-го типа: Функции',
            style: TextStyle(fontSize: 25),
          ),
          ListTile(
            leading: Icon(Icons.track_changes),
            title: Text('Отслеживание доз инсулина'),
            subtitle: Text('Ведение журнала инъекций или настроек инсулиновой помпы.'),
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text('Подсчет углеводов'),
            subtitle: Text('Инструменты для расчета углеводов и корректировки доз инсулина.'),
          ),
          ListTile(
            leading: Icon(Icons.device_hub),
            title: Text('Интеграция с CGM'),
            subtitle: Text('Отображение данных мониторинга глюкозы в реальном времени.'),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Частое отслеживание глюкозы'),
            subtitle: Text('Напоминания о необходимости измерений.'),
          ),
          Divider(),

          // Раздел для Типа 2
          const SizedBox(height: 10),
          Text(
            'Диабет 2-го типа: Функции',
            style: TextStyle(fontSize: 25),
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Отслеживание питания'),
            subtitle: Text('Журнал питания с контролем калорий и углеводов.'),
          ),
          ListTile(
            leading: Icon(Icons.directions_run),
            title: Text('Отслеживание физической активности'),
            subtitle: Text('Журнал упражнений и их влияния на глюкозу.'),
          ),
          ListTile(
            leading: Icon(Icons.medication),
            title: Text('Напоминания о медикаментах'),
            subtitle: Text('Уведомления о приеме таблеток или лекарств.'),
          ),
          ListTile(
            leading: Icon(Icons.visibility_off),
            title: Text('Отслеживание инсулина (опционально)'),
            subtitle: Text('Скрыто, если инсулин не используется.'),
          ),
          Divider(),

          // Раздел для Гестационного диабета
          const SizedBox(height: 10),
          Text(
            'Гестационный диабет: Функции',
            style: TextStyle(fontSize: 25),
          ),
          ListTile(
            leading: Icon(Icons.pregnant_woman),
            title: Text('Отслеживание глюкозы с учетом беременности'),
            subtitle: Text('Целевые уровни глюкозы, адаптированные для беременности.'),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('Отслеживание питания для беременности'),
            subtitle: Text('Рекомендации по питанию для беременных.'),
          ),
          ListTile(
            leading: Icon(Icons.event_note),
            title: Text('Напоминания о пренатальном уходе'),
            subtitle: Text('Уведомления о визитах к врачу или анализах.'),
          ),
        ],
      ),
    );
  }
}