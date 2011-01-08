Received: from mail-qy0-f170.google.com ([209.85.216.170]:52978 "EHLO
        mail-qy0-f170.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491022Ab1AHKYh convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 8 Jan 2011 11:24:37 +0100
Received: by qyk10 with SMTP id 10so228758qyk.15
        for <linux-mips@linux-mips.org>; Sat, 08 Jan 2011 02:24:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=zq=Tq+UxZMxdJRXWz=EZQ-oyf1gorm0uysPjk@mail.gmail.com>
References: <AANLkTikFNZiM9=Ym2sfZpstjse-zR69fh28OZ_aedUFe@mail.gmail.com>
        <AANLkTi=b52Aprg7G-bXo84W+_Ru6=VigUHRHGGDf-Y51@mail.gmail.com>
        <AANLkTimiXgBQr1arUdGgxGXnfqtoMvCMQivcujYc9VS0@mail.gmail.com>
        <AANLkTi=E7Q9kJvG1KUPv2xS3WK_12byksSrVH_g2UST2@mail.gmail.com>
        <AANLkTimR7PyJS000BsA-Q=pRXXY9Wht6_QtkRowv=OLM@mail.gmail.com>
        <AANLkTi=TgZd8XS410kYfiLp79M-=-8etgg0VEZGUme3N@mail.gmail.com>
        <AANLkTi=zq=Tq+UxZMxdJRXWz=EZQ-oyf1gorm0uysPjk@mail.gmail.com>
Date: Sat, 8 Jan 2011 15:54:30 +0530
Message-ID: <AANLkTimGNYeg=xZJy4qr9KmSpAMsy5Ss_pF18mwi1KrM@mail.gmail.com>
Subject: Re: Questions about complete
From: Rajat Sharma <fs.rajat@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <fs.rajat@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: loody <miloody@gmail.com>
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>, kernelnewbies@kernelnewbies.org
Message-ID: <20110108102430.WGUvgpbhA1HaGq0OGeRRBJYua1hi5CjM3MSxSHksYOg@z>

> B try to complete but cpu timer keep firing and at 8 it is time out.
> My platform is mips and is there any possibility to only let cpu timer
> be preemptible?
>

This seems really strange because when B calls complete, it sets up
condition variable value i.e. completion->done++ by disabling the
local interrupts. Following is code snippet from complete function:

        spin_lock_irqsave(&x->wait.lock, flags);
                   // This will disable interrupts
        x->done++;
                            // signals completion
        __wake_up_common(&x->wait, TASK_NORMAL, 1, 0, NULL);
        spin_unlock_irqrestore(&x->wait.lock, flags);

So now even if process A does not get a chance to execute and
completion timeout occurs before that, as you have shown in your
example, process A would still correctly knows about completion
because x->done was already set. Pleas look at the code snippet for
do_wait_for_common called from wait_for_completion_timeout:

          if (!x->done) {
                 ....
                 do {
                          ....
                 } while (!x->done && timeout);
                __remove_wait_queue(&x->wait, &wait);
                if (!x->done)
                        return timeout;
        }
        x->done--;
        return timeout ?: 1;
