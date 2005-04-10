Received: by wproxy.gmail.com with SMTP id 57so1072820wri
        for <linux-mips@linux-mips.org>; Sun, 10 Apr 2005 15:16:18 -0700 (PDT)
Message-ID: <ecb4efd10504101516482a9785@mail.gmail.com>
Date: Sun, 10 Apr 2005 18:16:17 -0400
From: Clem Taylor <clem.taylor@gmail.com>
Reply-To: Clem Taylor <clem.taylor@gmail.com>
Subject: troubles mmaping PCI device on Au1550
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-Path: <clem.taylor@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050410221617.oBdES3jTRdgnCkmKNAhLW2kCvJSszfs8AOcmXn2zbdI@z>

I'm working on a Au1550 driver for a PCI based co-processor. The
processor exports a 4Mbyte BAR that I want to mmap() into user space.
