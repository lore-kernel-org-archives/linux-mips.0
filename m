From: Keith Owens <kaos@ocs.com.au>
Subject: Re: DBE table ordering 
In-reply-to: Your message of "17 Apr 2002 23:39:16 MST."
             <1019111956.2095.66.camel@mathom>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 18 Apr 2002 16:51:40 +1000
Message-ID: <314.1019112700@ocs3.intra.ocs.com.au>
Sender: owner-linux-mips@oss.sgi.com
To: Mark Huang <mhuang@broadcom.com>
Cc: "'linux-mips@oss.sgi.com'" <linux-mips@oss.sgi.com>
Message-ID: <20020418065140.r3wwbjhiU8uHLTyG7s5L4G-e8odZH4d-k5902cDgAnE@z>

On 17 Apr 2002 23:39:16 -0700, 
"Mark Huang" <mhuang@broadcom.com> wrote:
From the objdump output, it looks like the exception table is in order
>at link time, but the DBE table is definitely out of order. What seems
>to be throwing it off is the dummy call to get_dbe() in traps.c. After
>sprinkling a few more calls to get_dbe() around the kernel and seeing
>what happens during link, it looks like any call to get_dbe() inside an
>__init section (or probably any explicitly located section) will throw
>off the ordering of the table. 

That is what I expected.  Various tables are built up from special
sections in each object.  The linker is correctly appending those
sections to the final table in vmlinux.  The use of multiple text
sections (init, exit, the rest) means that entries in a table for each
object are not necessarily in order, breaking the assumption that the
overall table is in order.

This is a more general problem than mips dbe, other kernel tables and
other architectures will have the same problem.  I will do a general
patch against 2.5.8 to sort these tables at init time, and backport the
general fix to 2.4.19 later.  In the meantime your patch will bypass
the problem for mips dbe.
