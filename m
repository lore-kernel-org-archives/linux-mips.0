Subject: Re: [2.4 PATCH] pcnet32.c - tx underflow error
Date: Thu, 11 Jul 2002 03:21:19 +0100 (BST)
In-Reply-To: <3D2CC891.1010506@mvista.com> from "Jun Sun" at Jul 10, 2002 04:51:45 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E17STa3-0008M5-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-mips@oss.sgi.com, Ralf Baechle <ralf@oss.sgi.com>, marcelo@conectiva.com.br
Message-ID: <20020711022119.guhdj595k2SSfwlUb7uss9YyJ0JqvRTkR-xy8ICiIhE@z>

> > Which slows the stuff down for people with real computers.
> 
> Contrary to what it might appear at first glance, it does not really.

Throughput and latency are quite different things. Try that on a latency
sensitive setup like a beowulf.
