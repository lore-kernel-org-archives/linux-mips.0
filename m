Message-ID: <009401c12650$021bcca0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3B7A70B8.ED92FE4@mips.com><20010815110634.A19305@nevyn.them.org> <20010816132042T.nemoto@toshiba-tops.co.jp>
Subject: Re: FP emulator patch
Date: Thu, 16 Aug 2001 14:35:46 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: dan@debian.org, Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
Cc: carstenl@mips.com, linux-mips@oss.sgi.com
Message-ID: <20010816123546._fESUZQi54wvG3ueOKZaGUf4tlOCFp6YARIuPLPHKo4@z>

> I also am trying to fix this problem.  How about my patch?
> 
> restore_sigcontext() can be more optimized, but I think this is a
> smallest patch to fix the problem.

I beleive that your patch might fix a symptom of the bugs
that I talked about in my mail last night, but it doesn't solve
the underlying problem.  With the signal setup/restore 
changes I posted last night, your patch should not be
necessary.

            Kevin K.
