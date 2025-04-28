find . -name "CMakeLists.txt" | while read -r file; do
    file=$(realpath $file)
    cat $file | sed -e 's/cmake_minimum_required(VERSION .*)/cmake_minimum_required(VERSION 4.0.0)/g' | tee $file
done