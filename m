From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200108220646.IAA13918@copsun17.mips.com>
Subject: Re: Magic numbers about stack layout
Date: Wed, 22 Aug 2001 08:46:01 +0200 (MET DST)
In-Reply-To: <20010822.144547.30190293.nemoto@toshiba-tops.co.jp> from "Atsushi Nemoto" at Aug 22, 2001 02:45:47 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010822064601.ifDsYXdKnwZGgZ5sB1rytYW0Y1NV8zwx7IRAScY50dY@z>

Hi,

what is the purpose of replacing the magic numbers with code analysis?
And what will happen when you run userland with MIPS16 or MIPS16e code?

We have it on our work-list to eventually clean up all the places in the
kernel that inspect code to allow MIPS16(e) code as well, so adding more
code inspection points is a bad idea unless it really is necessary.

/Hartvig

Atsushi Nemoto writes:
> 
> ----Next_Part(Wed_Aug_22_14:45:47_2001_172)--
> Content-Type: Text/Plain; charset=us-ascii
> Content-Transfer-Encoding: 7bit
> 
> There are some magic constant numbers about stack layout in
> thread_saved_pc() and get_wchan() function.
> 
> I made a patch to eliminate these magic numbers.  This patch analyzes
> some functions prologue codes in heuristic way at run-time.  "ps -l"
> (and "MAGIC SYSRQ" feature) works fine with this patch.
> 
> ---
> Atsushi Nemoto
