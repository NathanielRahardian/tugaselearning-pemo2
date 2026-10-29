import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/mata_kuliah.dart';
import '../widgets/jadwal_card.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  static const List<MataKuliah> _jadwal = [
    MataKuliah(
      kode: 'IF-024',
      nama: 'Pemrograman Mobile II',
      sks: 3,
      hari: 'Senin',
      waktu: '08.00–10.30',
      ruang: 'Lab Komputer 1',
    ),
    MataKuliah(
      kode: 'IF-021',
      nama: 'Basis Data',
      sks: 3,
      hari: 'Selasa',
      waktu: '10.00–12.30',
      ruang: 'Ruang 204',
    ),
    MataKuliah(
      kode: 'IF-018',
      nama: 'Rekayasa Perangkat Lunak',
      sks: 3,
      hari: 'Rabu',
      waktu: '13.00–15.30',
      ruang: 'Ruang 301',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final tanggalHariIni = DateFormat(
      'EEEE, d MMMM y',
      'id_ID',
    ).format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text('KampusKu'),
        actions: [
          IconButton(
            tooltip: 'Notifikasi',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Belum ada notifikasi baru.'),
                ),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Mahasiswa!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                const Text('Semua informasi kampusmu dalam satu tempat.'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tanggalHariIni,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Jadwal Kuliah',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Text(
                '${_jadwal.length} mata kuliah',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final mataKuliah in _jadwal)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: JadwalCard(mataKuliah: mataKuliah),
            ),
          const SizedBox(height: 8),
          Text(
            'Pengumuman',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          const Card(
            child: ListTile(
              leading: Icon(Icons.campaign_outlined),
              title: Text('Selamat datang di KampusKu'),
              subtitle: Text(
                'Aplikasi contoh untuk membantu mahasiswa melihat informasi kampus.',
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Card(
            child: ListTile(
              leading: Icon(Icons.assignment_outlined),
              title: Text('Pengingat tugas'),
              subtitle: Text(
                'Catat tenggat tugas agar aktivitas perkuliahan lebih teratur.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
