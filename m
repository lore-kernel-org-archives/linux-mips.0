Date: Wed, 21 Mar 2001 18:39:48 +0100 (CET)
From: Adrian Bunk <bunk@fs.tum.de>
Subject: Re: Compile error with current CVS kernel
In-Reply-To: <Pine.NEB.4.33.0103122252170.23935-100000@mimas.fachschaften.tu-muenchen.de>
Message-ID: <Pine.NEB.4.33.0103211837550.22248-100000@gaia.fachschaften.tu-muenchen.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010321173948.-6StJgwncSfd5Uy3SW9XSoE8H409xNEDvUJFp7FWt58@z>

Hi Ralf,

the latest CVS kernel still doesn't build, but the error message has
changed:

<--  snip  -->

...
mipsel-linux-nm vmlinux | grep -v '\(compiled\)\|\(\.o$\)\|\( [aUw]
\)\|\(\.\.ng$\)\|\(LASH[RL]DI\)' | sort > System.map
make[1]: Entering directory `/home/bunk/Ringo/linux/arch/mips/boot'
gcc -o elf2ecoff elf2ecoff.c
./elf2ecoff /home/bunk/Ringo/linux/vmlinux vmlinux.ecoff -a
Sections ordering prevents a.out conversion.
make[1]: *** [vmlinux.ecoff] Error 1
make[1]: Leaving directory `/home/bunk/Ringo/linux/arch/mips/boot'
make: *** [boot] Error 2

<--  snip  -->

cu
Adrian

-- 

Nicht weil die Dinge schwierig sind wagen wir sie nicht,
sondern weil wir sie nicht wagen sind sie schwierig.
