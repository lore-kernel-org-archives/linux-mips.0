Date: Thu, 29 Mar 2001 00:19:31 +0200
From: Ralf Baechle <ralf@oss.sgi.com>
Subject: Re: Problem with using modutils
Message-ID: <20010329001931.B4585@bacchus.dhis.org>
References: <0056910011132437000002L172*@MHS>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0056910011132437000002L172*@MHS>; from rajesh.palani@philips.com on Wed, Mar 28, 2001 at 01:53:04PM -0600
Sender: owner-linux-mips@oss.sgi.com
To: rajesh.palani@philips.com
Cc: linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20010328221931.xjVuxCsHaDliDCQ49OTtGCvFACE13p3W8S2gwVXnhjs@z>

On Wed, Mar 28, 2001 at 01:53:04PM -0600, rajesh.palani@philips.com wrote:

>    I am trying to use insmod on a MIPS platform.  I try to install a simple module & get the following errors:
> 
>    local symbol gcc2_compiled. with index 10 exceeds local_symtab_size 10
>    local symbol __gnu_compiled_c with index 11 exceeds local_symtab_size 10

This is a gas bug which somebody just fixed.  As a workaround for the time
until we can deploy the fix please re-link modules with a command like
ld -r -o new.o broken.o.

>    I use the following line for generating the object file:
>    mipsel-linux-gcc -D__KERNEL__  -DMODULE -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer  -G 0 -mno-abicalls -fno-pic -mcpu=r3000 -mlong-calls -mips1 -pipe  -c

That's correct.

>    I am using modutils version 2.3.11.  We have tried both Debian and RedHat sources cross-compiled for MIPS with the following options:
> CC=mipsel-linux-gcc CFLAGS="-I../linux/include -DMIPS" RANLIB=mipsel-linux-ranlib AR=mipsel-linux-ar ./configure  --disable-kerneld
> --disable-compat-2-0 --enable-insmod-static --target=mipsel-linux
> However the problem still remains.

Please upgrade to the latest modutils from ftp.kernel.org; it has a bugfixes
which are important for MIPS.

  Ralf
