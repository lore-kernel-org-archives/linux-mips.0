From: Dominic Sweetman <dom@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <16813.39660.948092.328493@doms-laptop.algor.co.uk>
Date: Wed, 1 Dec 2004 10:20:28 +0000
Subject: Re: [PATCH] Improve atomic.h implementation robustness
In-Reply-To: <20041201070014.GG3225@rembrandt.csv.ica.uni-stuttgart.de>
References: <20041201070014.GG3225@rembrandt.csv.ica.uni-stuttgart.de>
Return-Path: <dom@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Thiemo Seufer <ica2_ts@csv.ica.uni-stuttgart.de>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Nigel Stephens <nigel@mips.com>, David Ung <davidu@mips.com>
Message-ID: <20041201102028.KWik3GxxeVqYAVerD-URO2kVPiPRTL9rxhqN-2nvwpk@z>


Thiemo writes:

> the atomic functions use so far memory references for the inline
> assembler to access the semaphore. This can lead to additional
> instructions in the ll/sc loop, because newer compilers don't
> expand the memory reference any more but leave it to the assembler.
> 
> The appended patch...

I thought it was an explicit aim of the substantial rewrite of the
MIPS backend for 3.x to get the compiler to generate only "real"
instructions, not macros which expand to multiple instructions inside
the assembler.  So it's disappointing if newer compilers got worse.

Can one of our compiler-knowledgable people follow this up?

--
Dominic Sweetman
MIPS Technologies
