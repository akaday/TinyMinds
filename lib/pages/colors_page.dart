import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ColorsPage extends StatefulWidget {
  final String title;

  ColorsPage(this.title);

  @override
  _ColorsPageState createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  String _currentAudioPath = '';

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio(String audioPath) async {
    try {
      if (_currentAudioPath == audioPath && _isPlaying) {
        _stopAudio();
      } else {
        await _audioPlayer.play(DeviceFileSource(audioPath));
        setState(() {
          _isPlaying = true;
          _currentAudioPath = audioPath;
        });
      }
    } catch (e) {
      print('Audio player error occurred: $e');
      setState(() {
        _isPlaying = false;
      });
      _showErrorDialog();
    }
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Audio Player Error'),
        content: Text('An error occurred while playing the audio.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildLetterTile(String letter, String audioPath, String imagePath) {
    return GestureDetector(
      onTap: () {
        _playAudio(audioPath);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 248, 252, 255),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 110),
            SizedBox(height: 12.0),
            Text(
              letter,
              style: const TextStyle(
                color: Color.fromARGB(255, 96, 95, 95),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (_currentAudioPath == audioPath && _isPlaying)
              const Icon(
                Icons.volume_up,
                color: Color.fromARGB(255, 48, 149, 80),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 243, 246),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2, 
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            _buildLetterTile('Black', 'assets/colors/audio_colors/black.mp3', 'assets/colors/images_colors/black.png'),
            _buildLetterTile('White', 'assets/colors/audio_colors/white.mp3', 'assets/colors/images_colors/white.png'),
            _buildLetterTile('Blue', 'assets/colors/audio_colors/blue.mp3', 'assets/colors/images_colors/blue.png'),
            _buildLetterTile('Green', 'assets/colors/audio_colors/green.mp3', 'assets/colors/images_colors/green.png'),
            _buildLetterTile('Orange', 'assets/colors/audio_colors/orange.mp3', 'assets/colors/images_colors/orange.png'),
            _buildLetterTile('Pink', 'assets/colors/audio_colors/pink.mp3', 'assets/colors/images_colors/pink.png'),
            _buildLetterTile('Purple', 'assets/colors/audio_colors/purple.mp3', 'assets/colors/images_colors/purple.png'),
            _buildLetterTile('Red', 'assets/colors/audio_colors/red.mp3', 'assets/colors/images_colors/red.png'),
            _buildLetterTile('Yellow', 'assets/colors/audio_colors/yellow.mp3', 'assets/colors/images_colors/yellow.png'),
          ],
        ),
      ),
    );
  }
}
