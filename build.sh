for file in ./*/Dockerfile; do
    dir=$(dirname "$file")
    version=$(basename "$dir")
    echo prepare to build cimg for $file
    docker pull cimg/node:$version
    docker build . -t goodbai/cimg-node:$version -f ./$version/Dockerfile
    docker push goodbai/cimg-node:$version
done
