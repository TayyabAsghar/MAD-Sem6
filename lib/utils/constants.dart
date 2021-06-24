// All the URLs are temporary and may not work after sometime.
final fetchApiURI = Uri.parse('https://pcc.edu.pk/ws/list/ss_consumers.php');
final createApiURI = Uri.parse('https://pcc.edu.pk/ws/create/ss_consumers.php');
final uploadURI = Uri.parse('https://pcc.edu.pk/ws/file_upload.php');

const SLIDER_DATA = [
  {
    'title': 'Prime or Composite',
    'widgets': [
      'Text',
      'Icon',
      'AppBar',
      'Scaffold',
      'ElevatedButton',
      'AlertDialog',
      'Container',
      'Padding',
      'Drawer',
      'Center',
      'Column',
    ],
    'description':
        'A flutter Screen that tell whether the input number is Prime or Composite.',
    'image_url': 'assets/screenShots/Screen1.1.jpg',
    'video_url': 'assets/api-integration.mp4'
  },
  {
    'title': 'Navigation Drawer',
    'widgets': [
      'Text',
      'ListTile',
      'ClipRRect',
      'ModalRoute',
      'FadeInImage',
      'DrawerHeader',
      'ExpansionTile',
      'ElevatedButton',
      'NetworkImage',
      'AlertDialog',
      'AssetImage',
      'Container',
      'ListView',
      'Divider',
      'Column',
      'Icon',
    ],
    'description':
        'A Drawer that connects all the screens and help in navigation between the screens.',
    'image_url': 'assets/screenShots/Screen2.1.jpg',
    'video_url': 'assets/api-integration.mp4'
  },
  {
    'title': 'Image Collection',
    'widgets': [
      'Text',
      'Column',
      'AppBar',
      'InkWell',
      'Scaffold',
      'ListView',
      'Container',
      'NetworkImage',
      'IconButton',
      'TextButton',
      'ButtonBar',
      'Padding',
      'Drawer',
      'Stack',
      'Card',
      'Icon',
    ],
    'description':
        '''A flutter Screen that have Card Widgets with Images, Images description,
         Icons (related to Images) and Favorite button.''',
    'image_url': 'assets/screenShots/Screen3.1.jpg',
    'video_url': 'assets/api-integration.mp4'
  },
  {
    'title': 'Transaction',
    'widgets': [
      'Text',
      'AppBar',
      'Drawer',
      'ListView',
      'Flexible',
      'Container',
      'TextButton',
      'showDatePicker',
      'ElevatedButton',
      'CheckboxListTile',
      'DropdownButton',
      'TextFormField',
      'AlertDialog',
      'Scaffold',
      'Padding',
      'Column',
      'Card',
      'Icon',
    ],
    'description':
        'A flutter Screen that have multiple widgets to show a Mock Transaction.',
    'image_url': 'assets/screenShots/Screen4.1.jpg',
    'video_url': 'assets/api-integration.mp4'
  },
  {
    'title': 'Web-API Integration (for Jason Data)',
    'widgets': [
      'Text',
      'AppBar',
      'Center',
      'Scaffold',
      'ListView',
      'Container',
      'IconButton',
      'AlertDialog',
      'ElevatedButton',
      'SingleChildScrollView',
      'DropdownButton',
      'TextFormField',
      'DataTable',
      'DataCell',
      'Flexible',
      'Padding',
      'Column',
      'Hero',
      'Icon',
    ],
    'description':
        '''A flutter Screen that have 2 sub screens with multiple widgets to Send 
& Fetch data from an Integrated Web-API with meaningful messages on errors.''',
    'image_url': 'assets/screenShots/Screen5.jpg',
    'video_url': 'assets/api-integration.mp4'
  },
  {
    'title': 'Web-API Integration (for Pictures)',
    'widgets': [
      'Text',
      'Icon',
      'Center',
      'AppBar',
      'Scaffold',
      'ListBody',
      'IconButton',
      'ElevatedButton',
      'GestureDetector',
      'CircularProgressIndicator',
      'SingleChildScrollView',
      'CircleAvatar',
      'AlertDialog',
      'TextButton',
      'Divider',
      'Padding',
      'Column',
      'Stack',
    ],
    'description':
        '''A flutter Screen that have 1 sub screens with multiple widgets to Send 
image Integrated Web-API and to crop the image with meaningful messages on errors.''',
    'image_url': 'assets/screenShots/Screen8.1.png',
    'video_url': 'assets/api-integration.mp4'
  },
  {
    'title': 'Form Validation',
    'widgets': [
      'Row',
      'Text',
      'AppBar',
      'Scaffold',
      'TextFormField',
      'SingleChildScrollView',
      'Elevated Button',
      'Container',
      'SnackBar',
      'Checkbox',
      'Column',
      'Icon',
    ],
    'description':
        '''The Form shows multiple input methods and any invalidations on 
submitting the data like email format, empty fields and strong passwords.''',
    'image_url': 'assets/screenShots/Screen9.1.png',
    'video_url': 'assets/form-validation.mp4'
  },
  {
    'title': 'Tab Bars',
    'widgets': [
      'Text',
      'Column',
      'TabBar',
      'DropDown',
      'Scaffold',
      'DatePicker',
      'TabController',
      'ElevatedButton',
      'AnimatedContainer',
      'FloatingActionButton',
      'CheckboxListTile',
      'GestureDetector',
      'Pop-up Button',
      'AnimatedAlign',
      'ListTile',
      'Switch',
      'AppBar',
      'Radio',
      'Row',
    ],
    'description':
        '''A flutter Screen that have 2 sub screens with multiple widgets to show 
the implementation TabBars with different kinds of widgets and animations.''',
    'image_url': 'assets/screenShots/Screen9.1.png',
    'video_url': 'assets/tab-bars.mp4'
  },
  {
    'title': 'Carousel Slider & Video Player',
    'widgets': [
      'Icon',
      'Stack',
      'Drawer',
      'Center',
      'IconButton',
      'Video Player',
      'GestureDetector',
      'PageRouteBuilder',
      'Carousel Slider',
      'TextButton',
      'Container',
      'Scaffold',
      'AppBar',
      'Text',
      'Row',
    ],
    'description':
        '''A flutter Screen that have 2 sub screens to show a carousel Slider on 
screen to display each assignment details and a link to video player screen.''',
    'image_url': 'assets/screenShots/Screen11.jpeg',
    'video_url': 'assets/carousel-slider.mp4'
  },
];
