��    X      �     �      �     �  	   �     �  .   �  5   �  #     &   =  #   d     �  �   �  �   O	  ,   �	     
     
     
     "
     4
     B
     E
     M
     e
     v
  �   �
  
   /  #   :  1   ^     �     �     �      �     �     �  
   �  &   �       4        T     a  	   j     t     �     �     �  [   �             -   '     U  H   ^     �     �  ,   �     �     �               2     9  *   P  (   {     �  	   �     �  
   �     �     �  	   �  
                   $  P   *  $   {  %   �  A   �  t    *   }  T   �  (   �     &     +  2   8  M   k  	   �     �     �  �   �  �  �     k     �     �  d   �  E   �  $   B  L   g  U   �  2   
  �   =  �     [   �  	   '     1     5  -   G     u     �  
   �      �  "   �  &   �           ^   (  t   �     �             4   !  X   V     �     �  e   �     E  �   S     �     �            2   5  
   h  
   s  �   ~     .     =  z   L     �  |   �     b      r   a   w   F   �       !  !   1!  ?   S!     �!  *   �!  X   �!  T   5"  A   �"     �"  
   �"  
   �"     �"     #     #     %#     ;#     Q#     q#  �   }#     $  1   6$  f   h$  �  �$  1   v'  �   �'  J   ,(     w(     �(  ]   �(  �   )     �)  8   �)     �)  p  �)     9         -   N   J   4           W           L      %                     B                #   D                          F       )   *   /       1   +   ,       G       V   R   .   6      !   5   M          T       P   ;   8   E   '       (                   0   S                    >           =   U      Q          	   "          O       I       3   &                                @              
   <   2       H             ?   :      K   7   X   C       A   $        3D reflection 3D rotate A: Add a custom text watermark to your screenshot Add a shadow to the image on a transparent background Add a torn-like border to the image Add an inverted 3d border to the image Add sepia color toning to the image Add soft edges around the image Adds a fading reflection below an image and views it in perspective

Based on a script by Fred Weinhaus

http://www.fmwconcepts.com/imagemagick/3Dreflection/index.php Applies a perspective distortion to an image

Based on a script by Fred Weinhaus

http://www.fmwconcepts.com/imagemagick/3Drotate/index.php Apply a distortion effect to your screenshot Auto: B: Background color Barrel Distortion Bordereffects C: Channel Choose background color Choose sky color Choose stroke color Create various dispersion-like effects in the border of an image

Based on a script by Fred Weinhaus

http://www.fmwconcepts.com/imagemagick/bordereffects/index.php Curviness: Cut a jigsaw piece out of the image Cut out a jigsaw piece at the bottom right corner D: Density: Effect Error while executing plugin %s. Fade percent for mirror image Fade: Font size: Gap between image and mirror in pixels Gap: Give the picture an offset with itself as background Granularity: Gravity: Grayscale Hard Shadow Invert the colors of the image Jigsaw Piece 1 Jigsaw Piece 2 Make your screenshot look like a polaroid photo, add a caption, and even rotate it a little Negate Offset Opacity percent applied to whole mirror image Opacity: Output zoom factor; where value > 1 means zoom in and < 1 means zoom out Pad: Pef: Perseptive rotation about left edge of image Perspective exaggeration factor Polaroid Raise Border Raise a rectangular 3d-border Resize Resize your screenshot Rotation about image horizontal centerline Rotation about image vertical centerline Rotation about the image center Rotation: Sepia Sepia tone Shutter Branding Size: Sky color Soft Edges Stroke color Sunk Border Text: The base grain size or pixelization size used to create the detail in the border The curviness in the border features The frequency of detail in the border The pad size of constant color around the perimeter of the border The parameter d describes the linear scaling of the image. Using d=1, and a=b=c=0 leaves the image as it is. Choosing other d-values scales the image by that amount. a,b and c distort the image. Using negative values shifts distant points away from the center.

Defined by Barrel Correction Distortion, by Helmut Dersch.
http://www.all-in-one.ee/~dersch/barrel/barrel.html The size or dimension of the border region There are several wild-cards available, like
%Y = year
%m = month
%d = day
%T = time There was an error executing the plugin. Tool Torned Paper Turn the image into a grayscale image (256 shades) Turn the image into a polaroid one with the Shutter logo and a subtitle added Watermark Zoom factor for output image Zoom: off - No automatic adjustment

c - Center bounding box in output

zc - Zoom to fill and center bounding box in output

out - Creates an output image of size needed to hold the transformed image Project-Id-Version: gscrot-plugins-bash
Report-Msgid-Bugs-To: FULL NAME <EMAIL@ADDRESS>
POT-Creation-Date: 2010-08-31 19:30+0200
PO-Revision-Date: 2010-06-25 22:36+0000
Last-Translator: Mario Kemper (Romario) <mario.kemper@googlemail.com>
Language-Team: Russian <ru@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2010-08-31 23:05+0000
X-Generator: Launchpad (build Unknown)
 3D отражение 3D поворот А: Добавить собственный текстовый водяной знак на снимок Чёткая чёрная тень на прозрачном фоне Создает рваный край Создает утопленную прямоугольную 3D рамку Подцветка изображения в мягкий коричневый тон Скругляет углы изображения Добавляет перспективное искажение снимка и отражение

На основе скрипта Fred'а Weinhaus'а

http://www.fmwconcepts.com/imagemagick/3Dreflection/index.php Перспективное искажение снимка\n
\n
Основано на скрипте Fred Weinhaus'а\n
\n
http://www.fmwconcepts.com/imagemagick/3Drotate/index.php Применить эффект искривления на выбранный снимок Авто: Б: Цвет фона Бочкообразные искажения Эффекты границ В: Канал Выбрать цвет фона Выберите цвет неба Выберите цвет штриха Создание различных дисперсионно подобных эффектов на границе изображения

На основе сценария от Фреда Вайнхауса

http://www.fmwconcepts.com/imagemagick/bordereffects/index.php Изгиб: Вырезает кусочек мозайки пазл из всего изображения Вырезает в нижнем правом углу изображения кусочек мозайки пазл Г: Плотность: Эффект Ошибка выполнения плагина %s. Процент затемнения для зеркального изображения Затемнение Размер шрифта: Расстояние между изображением  и отражением в пикселях Отступ: Создает вокруг изображения рамку с самим изображением в качестве фона Зернистость: Гравитация: Оттенки серого Чёткая тень Инвертировать цвета снимка Пазл 1 Пазл 2 Преобразование снимка в формат \"полароид\", добавление надписи и небольшой поворот изображения Негатив Позиция Процент прозрачности применимый ко всему зеркальному изображению Непрозрачность: Изменение масштаба, где z > 1 обозначает увеличение, а z < 1 - уменьшение Планшет: Pef: Вращение перспективы вокруг левого края изображения Коэффициент перспективного искажения Полароид Выступающая рамка Выступающая прямоугольная 3D рамка Изменить размер Изменить размер снимка Вращение вокруг горизонтальной оси изображения Вращение вокруг вертикальной оси изображения Вращение вокруг центра изображения Поворот: Сепия Сепия Штамп Shutter Размер: Цвет неба Мягкие углы Цвет штриха Утопленная рамка Текст: Базовый размер зерна или размер пикселизации используемый для создания деталей границ Изгиб границ Частота деталей на границе Размер планшета постоянного цвета по периметру границы Параметр d описывает линейное масштабирование изображения. Использование d=1 и a =b=c=0 оставляет изображение как есть. Выбор других значений d масштабирует изображение на это значение. a, b и c искажают изображение. Использование отрицательных значений сдвигает далекие точки от центра.

Определение из Коррекции бочкообразных искажений, Helmut Dersch.
http://www.all-in-one.ee/~dersch/barrel/barrel.html Размер или величина границ Вы можете использовать следующие маски:
%Y = год
%m = месяц
%d = день
%T = время Произошла ошибка при выполнении плагина Инструмент Рваная бумага Создает изображение в оттенках серого (256 оттенков) Создает карточку полароид с логотипом Shutter и именем файла в качестве надписи Водяной знак Масштаб итогового изображения Масштаб: off - Без пересчета размеров

c - Центрировать изображение и обрезать по размеру рамки

zc - Центрировать изображение и вписать в размеры рамки

out - Увеличить рамку до размеров преобразованного изображение 