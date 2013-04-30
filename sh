#!/bin/bash

echo "Программа поиска файлов по имени или размеру"
echo "Разработчик: Пономарев Сергей"

while [ true ]
do
echo "Начать выполнение?(y/n)"
read ex
 case $ex in
  n )
     echo "Программа завершена"
     exit 0
  ;;
  y )
   while [ $ex = y ]; do
echo -n "Введите католог для поиска "
read c
	while [ ! -d "$c" ]; do
	echo -n "Каталога не существует! Еще раз?(y/n) "
       		read ex
        	case $ex in
        	y )
          		echo -n "Введите каталог ";
          		read c
        	;;
        	n )
        		exit 0
        	;;
        	esac
	done   
echo "Выберите действие: 1.Поиск по имени файла 2.Поиск по размеру"
read d
   case $d in
    1 )
echo "Введите имя файла"
       read name
       test -f $c'*'$name'*'
         find $c -type f -name '*'$name'*' -print 2>/dev/null
          ex=n
        ;;

        2 )
         echo "Введите размер в килобайтах"
         read s
         find $c -size +"$s"k 2>/dev/null
         break
        ;;

        * )
         echo "Ошибка! Хотите продолжить?(y\n)"
         read ex
         if [ $ex = n ]; then
exit 0
           fi
esac
done
esac

done
exit 0
