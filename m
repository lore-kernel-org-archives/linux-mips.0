Date: Mon, 17 Jun 2002 13:04:39 -0700 (PDT)
From: James Simmons <jsimmons@transvirtual.com>
Subject: Re: tx3912 Re: [PATCH] fbdev updates.
In-Reply-To: <20020606211252.GA1112@elf.ucw.cz>
Message-ID: <Pine.LNX.4.44.0206171304110.31825-100000@www.transvirtual.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Pavel Machek <pavel@ucw.cz>
Cc: Linux Fbdev development list <linux-fbdev-devel@lists.sourceforge.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mips@oss.sgi.com, linux-mips-kernel@lists.sourceforge.net
Message-ID: <20020617200439.Gqk-iNpiv2tb1aQn8uYlrClKSBA5MFWsTuyMrJ_bHso@z>


> Hi!
>
> >    This patch includes the latest in the fbdev BK repository. I have
> > modified several fbdev drivers (maxinefb, tx3912fb, pmag drivers) to the
> > new api. Please test these changes out before I submit them to linus.
> > Thank you. It is against the latest BK tree and 2.5.20.
>
> Does the code even boot on any machine having tx3912fb?

Yes :-) Also a few other types of MIPS devices use this framebuffer.
