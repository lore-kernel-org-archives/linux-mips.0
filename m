Message-ID: <019401c21b99$387ce290$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3D1729F3.7241A74A@mips.com> <3D17376B.59333E27@niisi.msk.ru> <20020624173954.A1109@dea.linux-mips.net>
Subject: Re: Bug in __copy_user
Date: Mon, 24 Jun 2002 18:07:18 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>, "Gleb O. Raiko" <raiko@niisi.msk.ru>
Cc: Carsten Langgaard <carstenl@mips.com>, linux-mips@oss.sgi.com
Message-ID: <20020624160718.5wwZ43HPggfBxSdwWEoPzMj1ax_fj2RVgPlRuq7gY8M@z>

From: "Ralf Baechle" <ralf@oss.sgi.com> 
> On Mon, Jun 24, 2002 at 07:14:51PM +0400, Gleb O. Raiko wrote:
> 
> > This patch also solves the problem for mips in 2.4/2.5 kernel. My
> > question was about the patch for mips64 and mips in 2.2 kernel.
> > 
> > Shall memcpy.S from 2.4/2.5 be backported to 2.2 and mips64?
> 
> I think that would be the prefered solution as it'll be easier to maintain.
> 
> I've not received any 2.2 patches in a very long, long time - anybody
> actually still using it?

Only a few thousand (or tens of thousands) of Sony Playstation 2
users.  ;-)  Most of them are running the wierd 2.2.1.?? Sony
branch, but there are a few poor deluded souls tryng to update
to 2.2.20...

            Kevin K.
