Message-ID: <3ADB2F50.80904@Lineo.COM>
Date: Mon, 16 Apr 2001 11:43:44 -0600
From: Quinn Jensen <jensenq@Lineo.COM>
MIME-Version: 1.0
Subject: Re: CVS Update@oss.sgi.com: linux
References: <200104111800.LAA23131@google.engr.sgi.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Cc: Ralf Baechle <ralf@oss.sgi.com>, Kanoj Sarcar <kanoj@oss.sgi.com>, linux-origin@oss.sgi.com
Message-ID: <20010416174344.9VlwBwXDlUcehCqWTw8ePxuRJ437g98BTuj3hCm5Ffo@z>


> 
> receive_chars() was updated to look at ignore_mask ... if CREAD is not
> set, around the time of opening via ioctls etc, it will not take inputs.
> I haven't figured the details out, but I believe it is more of a *getty
> config issue than anything else. 
> 
> Kanoj

Same thing happens when I bring up 2.4.3 straight
to a shell w/out any getty, as well.

Quinn
