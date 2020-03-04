# Récupération des données du fichier texte
arg1 = File.read(ARGV[0])
arg1.gsub!("\n", " ")

# Je découpe les données par lignes
rows = arg1.split("\s")

# Methode pour séparer chaques valeurs de chaques lignes
def array_splitter(arr)
  i = 0
  for v in arr
    v = v.split("")
    arr[i] = v
    i += 1
  end
end

array_splitter(rows)
# Je supprime tout ce qui n'est pas un integer
rows.delete_at(3)
rows.delete_at(6)
rows.each_index do |x|
  rows[x].delete("|")
  rows[x].map!{|str|str.to_i}
end

# Création d'un tableau de colonnes
y = 0
x = 0
cols = []
while x != 9
  while y != 9
    cols.push(rows[y][x])
    y += 1
  end
  y = 0
  x += 1
end
cols = cols.each_slice(9).to_a

# Je met les valeurs comprises dans chaques carrés
# de 3*3 dans 9 variables
x = 0
c1 = []
while x != 3
  c1.push(rows[x][0..2])
  x += 1
end
c1 = c1[0] + c1[1] + c1[2]

x = 0
c2 = []
while x != 3
  c2.push(rows[x][3..5])
  x += 1
end
c2 = c2[0] + c2[1] + c2[2]

x = 0
c3 = []
while x != 3
  c3.push(rows[x][6..8])
  x += 1
end
c3 = c3[0] + c3[1] + c3[2]

x = 3
c4 = []
while x != 6
  c4.push(rows[x][0..2])
  x += 1
end
c4 = c4[0] + c4[1] + c4[2]

x = 3
c5 = []
while x != 6
  c5.push(rows[x][3..5])
  x += 1
end
c5 = c5[0] + c5[1] + c5[2]

x = 3
c6 = []
while x != 6
  c6.push(rows[x][6..8])
  x += 1
end
c6 = c6[0] + c6[1] + c6[2]

x = 6
c7 = []
while x != 9
  c7.push(rows[x][0..2])
  x += 1
end
c7 = c7[0] + c7[1] + c7[2]

x = 6
c8 = []
while x != 9
  c8.push(rows[x][3..5])
  x += 1
end
c8 = c8[0] + c8[1] + c8[2]

x = 6
c9 = []
while x != 9
  c9.push(rows[x][6..8])
  x += 1
end
c9 = c9[0] + c9[1] + c9[2]


# cration de tableau de référence pour y soustraire les valeurs
# déjà prises dans les carrés, cols, rows
from_1_to_9 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
values = []
# je parcours chaques valeurs de chaques lignes
rows.each_index do |x|
  rows[x].each_index do |y|
# si une valeur est égale à 0 (case vide)
    if rows[x][y] == 0
      case x
# si l'index de cette valeur est compris dans le carré 1,
# soustraire aux valeurs possibles celles comprise dans
# la ligne à laquelle elle appartient, la colonne, puis le carré
# puis stocker la valeur obtenue dans "values"
      when 0..2
        case y
        when 0..2
          values += from_1_to_9 - rows[x] - cols[y] - c1
        when 3..5
          values += from_1_to_9 - rows[x] - cols[y] - c2
        when 6..8
          values += from_1_to_9 - rows[x] - cols[y] - c3
        end
      when 3..5
        case y
        when 0..2
          values += from_1_to_9 - rows[x] - cols[y] - c4
        when 3..5
          values += from_1_to_9 - rows[x] - cols[y] - c5
        when 6..8
          values += from_1_to_9 - rows[x] - cols[y] - c6
        end
      when 6..8
        case y
        when 0..2
          values += from_1_to_9 - rows[x] - cols[y] - c7
        when 3..5
          values += from_1_to_9 - rows[x] - cols[y] - c8
        when 6..8
          values += from_1_to_9 - rows[x] - cols[y] - c9
        end
      end
    end
  end
end

# conversion des valeurs obtenues en strings pour les transférer
# sur l'affichage original
values.map!{|int|int.to_s}
# récupération de l'affichage original du sudoku
sudoku_solved = File.read(ARGV[0])
# je parcours mon tableau de valeurs
values.each do |x|
  sudoku_solved["_"] = x
# remplacer les cases vides du sudoku 1 à 1 par les valeurs
end

print sudoku_solved
