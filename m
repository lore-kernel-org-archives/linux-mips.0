Received: from wsyash ([192.168.1.109]) by nt_server.stellartec.com
          (Post.Office MTA v3.1.2 release (PO205-101c)
          ID# 568-43562U100L2S100) with SMTP id AAA356
          for <linux-mips@linux-mips.org>; Tue, 7 Oct 2003 09:50:50 -0700
Reply-To: <yshitoot@stellartec.com>
From: yshitoot@stellartec.com (Yashwant Shitoot)
Subject: touch panel
Date: Tue, 7 Oct 2003 09:50:17 -0700
Message-ID: <002e01c38cf3$16cea990$6d01a8c0@wsyash>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <yshitoot@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20031007165017.O4HoPf4w3jsBjdbr6Q3s527QrFywKSfQZXn1Z2TgeMk@z>

Hello,

About 10% of the time as I lift my finger up the x or the y value changes
e.g.
from my printf statement

status=fffc0000, x=135, y=46
(similar numbers repeated a few times)
status=fffc0000, x=136, y=47
status=fffc0000, x=74, y=113
status=0.x=0,y=0

Have others seen this problem ? any suggestions ? (yes I can always through
away the
line before status changes)

thanks

yash
