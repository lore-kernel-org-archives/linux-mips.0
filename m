Date: Thu, 31 Jan 2002 20:02:25 -0800 (PST)
From: Kaz Kylheku <kaz@ashi.footprints.net>
Subject: Re: [libc-alpha] Re: PATCH: Fix ll/sc for mips
In-Reply-To: <20020201.123523.50041631.machida@sm.sony.co.jp>
Message-ID: <Pine.LNX.4.33.0201311952440.2305-100000@ashi.FootPrints.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Hiroyuki Machida <machida@sm.sony.co.jp>
Cc: hjl@lucon.org, macro@ds2.pg.gda.pl, libc-alpha@sources.redhat.com, linux-mips@oss.sgi.com
Message-ID: <20020201040225.__4jziERB25iNWChbXVZY49YDmuwObNLfEtT8k9ztP4@z>

On Fri, 1 Feb 2002, Hiroyuki Machida wrote:
> Please note that "sc" may fail even if nobody write the
> variable. (See P.211 "8.4.2 Load-Linked/Sotre-Conditional" of "See 
> MIPS RUN" for more detail.) 
> So, after your patch applied, compare_and_swap() may fail, even if
> *p is equal to oldval.

I can't think of anything that will break because of this, as long
as the compare_and_swap eventually succeeds on some subsequent trial.
If the atomic operation has to abort for some reason other than *p being
unequal to oldval, that should be cool.
