Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199707172050.QAA11880@neon.ingenia.ca>
Subject: strace 'LOOP' for MIPS
Date: Thu, 17 Jul 1997 16:50:54 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970717205054.Vzgyd8dpWZU0SBYJUvul_awTG_lPWHKGVPbGvFoHBns@z>

From strace/util.c:
#ifdef I386
#define LOOP	0x0000feeb
#else /* !I386 */
#ifdef M68K
#define LOOP	0x60fe0000
#else /* !M68K */
#ifdef ALPHA
#define LOOP    0xc3ffffff
#endif /* ALPHA */
#endif /* !M68K */
#endif /* !I386 */

What should LOOP be for the MIPS?
It appears to be the address of the breakpoint handler, but I'm not
sure:
	ptrace(PTRACE_POKETEXT, tcp->pid, (char *) tcp->baddr, LOOP);
	if (errno) {
		perror("setbpt: ptrace(PTRACE_POKETEXT, ...)");
		return -1;
	}

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>                   Welcome to the technocracy.
#>                                                                     
#> "you'd be so disappointed
#>              to find out that the magic was not
#>                          really meant for you" - OLP
