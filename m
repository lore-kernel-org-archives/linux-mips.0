Subject: Re: Dumb Question on Cross-Development
Date: Wed, 4 Apr 2001 12:22:16 +0100 (BST)
In-Reply-To: <20010404120211.C11161@paradigm.rfc822.org> from "Florian Lohoff" at Apr 04, 2001 12:02:11 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E14klMh-0001kx-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Florian Lohoff <flo@rfc822.org>
Cc: Jun Sun <jsun@mvista.com>, "Kevin D. Kissell" <kevink@mips.com>, "\"MIPS/Linux List SGI\"" <linux-mips@oss.sgi.com>
Message-ID: <20010404112216.dvpI_9O3oyLc6tvhXt0JX6F8e9zQBgZqjjC44sjtz-I@z>

> We already had the discussion on parts of that implementation. Honestly - 
> I dont like the stuff - Rolling out mips packages as "noarch" is
> simply broken - And the argument that one would want to install
> it on a i386 nfs root is simply an excuse for a broken rpm or missing
> installer.

Or a flawed packaging tool. RPM allows you to force noarch and you can use it
to get around this precise problem. Its also useful when you want to force
an x86 package onto an Alpha with em86.

I find it hard to believe dpkg lacks such a feature.
