Date: Tue, 4 Jun 2002 13:05:27 -0700 (PDT)
From: James Simmons <jsimmons@transvirtual.com>
Subject: [PATCH] fbdev updates.
Message-ID: <Pine.LNX.4.44.0206041248330.1200-100000@www.transvirtual.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Linux Fbdev development list <linux-fbdev-devel@lists.sourceforge.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mips@oss.sgi.com, linux-mips-kernel@lists.sourceforge.net
Message-ID: <20020604200527.u9WFHr7ujZe9EcHIq7KfWBmZQhOrjf9G1cO0slB2bUs@z>


Hi!

   This patch includes the latest in the fbdev BK repository. I have
modified several fbdev drivers (maxinefb, tx3912fb, pmag drivers) to the
new api. Please test these changes out before I submit them to linus.
Thank you. It is against the latest BK tree and 2.5.20.

diff:

   http://www.transvirtual.com/~jsimmons/fbdev.diff.gz

BK:

   http://fbdev.bkbits.net:8080/fbdev-2.5

   . ---
   |o_o |
   |:_/ |   Give Micro$oft the Bird!!!!
  //   \ \  Use Linux!!!!
 (|     | )
 /'\_   _/`\
 \___)=(___/
