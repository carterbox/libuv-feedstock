mkdir %SRC_DIR%\stage
if errorlevel 1 exit /b 1

cmake -LAH -G Ninja -S . -B build ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_INSTALL_PREFIX:PATH="%SRC_DIR%\stage" ^
  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX%
cmake --build build --target install --parallel %CPU_COUNT%
if errorlevel 1 exit /b 1
