Date: Tue, 24 Jun 2003 06:00:16 -0400 (EDT)
From: <ik@cyberspace.org>
Subject: is there any docs/manuals for linker scripts symbols
Message-ID: <Pine.SUN.3.96.1030624055005.4605A-100000@grex.cyberspace.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <ik@grex.cyberspace.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: kernelnewbies@nl.linux.org, linux-mips@linux-mips.org
Message-ID: <20030624100016.RqVZLXr2ud1pThOi2sSLGg57HvvwL22192I8ok9wGqA@z>

Hi All,

Is there any documentation for the symbols in the ld.script linker
scripts for the linux kernel. 

I'm porting Linux kernel to a mips board for which I need to understand
the various symbols used in the kernel.

For example what is the use of the following symbols
`__init_begin'
`__init_end'
`__initcall_start
`__initcall_end'
`_ftext'
`__setup_start'
`__setup_end'

I'm not good in these linker scripts... any help pointers would be of
great help to me ! (I'm referrring gnu ld  manual pages ... still have a
long way to go :(

Thanks in advance !
Indu
