; Copyright (C) 2022, 2023 Tamerlan Bimzhanov

%define arg(n)		ebp+(4*n)+4
%define local(n)	ebp-(4*n)

%macro pcall 1-*
  %rep %0-1
    %rotate -1
		push dword %1
  %endrep
  %rotate -1
		call %1
  %if %0 >= 2
		add esp, (%0-1)*4
  %endif
%endmacro
