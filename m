From: "Robert Rusek" <robru@teknuts.com>
Subject: RE: Latest kernel?
Date: Sun, 24 Feb 2002 18:43:17 -0800
Message-ID: <001401c1bda6$352f7d10$6601a8c0@delllaptop>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020220221507.GC29624@paradigm.rfc822.org>
Sender: owner-linux-mips@oss.sgi.com
To: 'Florian Lohoff' <flo@rfc822.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020225024317.RQpl9_VzRTQUUN2cUPRgw1g1e_KyqdBbBJDvBKOZI8s@z>

Florian,

I checked the oss.sgi.com cvs and they do not seem to have linux_2_4
only linux-2.4-xfs.  Is that what I am looking for?  Will that give me a
working 2.4.x kernel?

Thanks in advance,
Rob.

-----Original Message-----
From: owner-linux-mips@oss.sgi.com [mailto:owner-linux-mips@oss.sgi.com]
On Behalf Of Florian Lohoff
Sent: Wednesday, February 20, 2002 2:15 PM
To: Robert Rusek
Cc: linux-mips@oss.sgi.com
Subject: Re: Latest kernel?


On Wed, Feb 20, 2002 at 02:00:36PM -0800, Robert Rusek wrote:
> Where can I obtain the latest stable build of the kernel.  I need it 
> to work on my SGI IP22.  If possible I do not want to use CSV since I 
> do not have a high speed internet connection.  Any help would be 
> greatly appreciated.

I dont think there are regular tarballs - Take the pain once - checkout
the kernel and before modifying make a tarball. Then you can just

cvs -z3 update -Pd 

Your tarball all the time. BTW: You should checkout -r linux_2_4 as i
dont think 2.5 has success reports on mips already.

Flo
-- 
Florian Lohoff                  flo@rfc822.org
+49-5201-669912
Nine nineth on september the 9th              Welcome to the new
billenium
