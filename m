Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: never mind
Date: Sat, 6 Jul 2002 15:34:54 -0700
Message-ID: <020401c2253d$5a4cca90$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com, linux-mips-kernel@lists.sourceforge.net
Message-ID: <20020706223454.e1GXOVp0vxn6tmwTmBrAJkRGxl7xeDcCZYIylYzdwvw@z>

Well I fixed it. Somehow kswapd_wait gets a bad entry in its task_list and
it's always 0xffffffff8. So, putting a hack in __wake_up_common to look for
that address and break out (since that always seems to be at the end of the
list) fixed the problem. How odd. Of course I really should find out why
that bad value gets in there, but I'm so lazy.

Steve
