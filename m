Date: Wed, 19 Jun 2002 13:38:52 -0700 (PDT)
From: Paul Jackson <pj@engr.sgi.com>
Subject: Re: [PATCH] include/asm-mips/pci.h
In-Reply-To: <20020619112207.B6057@ayrnetworks.com>
Message-ID: <Pine.LNX.4.44.0206191326560.18638-100000@turbo-linux.engr.sgi.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: William Jhun <wjhun@ayrnetworks.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, linux-mips@oss.sgi.com
Message-ID: <20020619203852.7gMlVoViqrCEGGv5EeJDUoWbQDvK_-C9m7oPyWvQJDQ@z>

On Wed, 19 Jun 2002, William Jhun wrote:
> Note that without the #ifdefs, you may get warnings like:
>
> ../../../ayr/linux/include/asm/pci.h: In function `prep_buffer':
> ../../../ayr/linux/include/asm/pci.h:89: warning: statement with no effect
> ...
>
> So are we still sure we want to leave them out?


Yes - leave them out (speaking out of context here - hopefully still
useful).

Remove the warnings instead.

I've gotten in the habit of having the following form to
optional code logic:

In some header file foobar.h:

    #if CONFIG_FOOBAR
    #define init_foobar(x) do {		\
	    int f = 2 * (x);		\
	    foobar_initialize(f);	\
	| while (0)
    #else
    #define init_foobar(x) do {} while (0)
    #endif

I don't see any warnings from this, and it provides just
the right sort of syntax wrapper on the macro init_foobar(),
forcing it to be a single statement, regardless of context,
while providing a nested block context for any local variables.


-- 
                          I won't rest till it's the best ...
                          Programmer, Linux Scalability
                          Paul Jackson <pj@sgi.com> 1.650.933.1373
