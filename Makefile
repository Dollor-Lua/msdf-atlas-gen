CXX=g++
AR=ar

CFLAGS=-std=c++11 -Imsdf-atlas-gen/ -Imsdfgen/ -Imsdfgen/include/ -D_CRT_SECURE_NO_WARNINGS
STATICS=msdfgen/bin/libmsdfgen.a msdfgen/freetype/objs/freetype.a

DIRS := msdf-atlas-gen

SRC := $(wildcard $(addsuffix /*.cpp, $(DIRS)))
OBJ := $(patsubst %.cpp,bin/%.o,$(SRC))

LIBRARY := bin/libmsdf-atlas-gen.a

all: msdfgen/bin/libmsdfngen.a $(LIBRARY)

$(LIBRARY): $(OBJ)
	echo $(SRC)
	$(AR) rcs $@ $^

bin/%.o: %.cpp
	if not exist bin/msdf-atlas-gen/ mkdir bin\msdf-atlas-gen
	$(CXX) $(CFLAGS) -c $< -o $@ $(STATICS)

msdfgen/bin/libmsdfngen.a:
	$(MAKE) -C msdfgen/