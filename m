Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: RE: kernel BUG at slab.c:1073!
Date: Thu, 25 Jul 2002 05:06:37 -0700
Message-ID: <011101c233d3$bab16860$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3D3EFCDE.5050503@mvista.com>
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020725120637.HOIvXSsA07FUesnq4AV76HgdJNiGwzBVyFxB9S-3Xw0@z>

I had this problem when trying to run a module compiled for kernel version
2.4.18 on the old 2.4.0-test9 VR kernel. Something to do with different flag
values I think. A recompile with links to the proper kernel sources solved
the problem. Kmalloc was causing the issue. The flag value of GFP_KERNEL was
different or something.

Steve
