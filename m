Message-ID: <045b01c43155$1e06cd80$8d01010a@prefect>
From: "Bradley D. LaRonde" <brad@laronde.org>
Subject: uclibc mips ld.so and undefined symbols with nonzero symbol table entry st_value
Date: Mon, 3 May 2004 17:25:11 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <brad@laronde.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: uclibc@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20040503212511.NwKEgiVs8AXdAaFCAijPFd-D4FFgPLsHKDDQF7hH17Q@z>

I would like ld.so in uClibc CVS HEAD (last week or so) to pass the
test/dlopen/ tests on mips(el).  I'm currently focusing on dltest.  As-is
dltest seg faults soon after ld.so hands control over to the application.

Some background:  I'm using the uClibc "buildroot" environment, that first
builds a mipsel cross-toolchain and then cross-builds a mipsel uClibc root
file system image with Busybox.  I configure busybox to build statically.
I'm using buildroot's stock gcc 3.3.3 configuration and I have upgraded my
local buildroot to binutils 2.15.90.0.1.1.

When dltest runs, it ends up segfaulting inside ld.so.  I tracked down the
crash to what appears to me to be a bogus pointer to the malloc function.
This only happens if I specify -lpthread in the build of dltest.  uClibc
libc.so contains weak symbols shadowing libpthread symbols so dltest will
build without -lpthread.  dltest doesn't actually use any libpthread
functionality AFAICT.

The apparently bogus pointer-to-malloc get's assigned to pointer-to-function
global variable _dl_malloc_function in libdl's dlopen.c, line 164.  The
pointer that gets assigned falls in libpthread's address space.
Interestingly in points to what appears to be a procedure stub to malloc.
readelf on libpthread.so shows:

       312: 00003680     0 FUNC    GLOBAL DEFAULT  UND malloc

and that's right where the apparently bogus pointer points... libpthread's
base virtual address + 0x3680.  ld.so crashes shortly afterward when it
calls _dl_malloc (which calls _dl_malloc_function) from
uClibc/ldso/ldso/dl-hash.c::_dl_add_elf_hash_table.  At least I think that's
the function; I tracked it exactly but didn't make a note.  :-(

I suppose that binutils is pointing out a stub based on this MIPS PS ABI
paragraph:

    If an executable or shared object contains a reference to a
    function defined in one of its associated shared objects, the
    symbol table section for that file will contain an entry for
    that symbol. The st_shndx member of that symbol table entry
    contains SHN_UNDEF. This signals to the dynamic linker that
    the symbol definition for that function is not contained in
    the executable file. If there is a stub for that symbol in
    the executable file and the st_value member for the symbol
    table entry is nonzero, the value will contain the virtual
    address of the first instruction of that procedure's stub.
    Otherwise, the st_value member contains zero. This stub calls
    the dynamic linker at runtime for lazy text evaluation. See
    "Function Addresses" in Chapter 5 for details.

I guess that the point of these procedure stubs is to keep
pointer-to-function values consistent between executables and share
libraries.  Is that what binutils is trying to accomplish here?

But should stubs really be getting involved here?  As Thiemo Seufer pointed
out to me, readelf shows me that every undefined symbol in every shared
library in /lib on my x86 debian box has the st_value member for the symbol
table entry set to zero.  I think Thiemo verified the same on some mips
linux box.  Does that mean no stubs in shared libraries?

This stuff is way off the map for me.  I would appreciate any help you have
to offer.  Thanks.

Regards,
Brad
