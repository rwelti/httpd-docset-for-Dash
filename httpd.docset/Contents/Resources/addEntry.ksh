#!/bin/ksh

# invoked like this:
#   find . -name "*html" -exec addEntry.ksh {} \;


#echo type is $type

   #echo entering a section
   topic=""
   file=""
   echo $1 | sed -e 's?.*Documents/??g'|  awk -F \/ '{print $1, " ", $2, " ", $3}' | read topic file

   echo topic of $topic  file is  $file

   if [[ "$file" == "index.html" ]] ; then
      sql="INSERT OR IGNORE INTO searchIndex(name, type, path) VALUES ('$topic', 'Guide', '$topic/index.html');"
      echo $sql
      #echo "$sql" | sqlite docSet.dsidx
   else 
      if [[ "$file" == "" ]] ; then
         echo $topic | sed -e 's/.html//g' | read topic
         sql="INSERT OR IGNORE INTO searchIndex(name, type, path) VALUES ('$topic', 'Section', '$topic.html');"
         echo $sql
         echo "$sql" | sqlite docSet.dsidx
      else
         echo $file | sed -e 's/.html//g' | read subtopic
         sql="INSERT OR IGNORE INTO searchIndex(name, type, path) VALUES ('$subtopic', 'Section', '$topic/$file');"
         echo $sql
         echo "$sql" | sqlite docSet.dsidx
      fi
   fi


   #topic=`echo $2 | sed -e 's?.*/??g'`
   #echo topic is $topic
   
exit

echo "$arg" | sqlite docSet.dsidx
