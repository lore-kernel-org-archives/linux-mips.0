Received: from mail-iw0-f195.google.com ([209.85.223.195]:45934 "EHLO
	mail-iw0-f195.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1492913AbZJ3CQY (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 30 Oct 2009 03:16:24 +0100
Received: by iwn33 with SMTP id 33so1828525iwn.21
        for <linux-mips@linux-mips.org>; Thu, 29 Oct 2009 19:16:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1256797212-7794-1-git-send-email-wuzhangjin@gmail.com>
References: <1256797212-7794-1-git-send-email-wuzhangjin@gmail.com>
Date: Fri, 30 Oct 2009 10:16:14 +0800
Message-ID: <a2dc26810910291916x1556eb21uecaa8bdeeb98baae@mail.gmail.com>
Subject: Re: [PATCH -v1] MIPS: a few of fixups and cleanups for the compressed
	kernel support
From: Chih-hung Lu <winfred.lu@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <winfred.lu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Wu Zhangjin <wuzhangjin@gmail.com>, Linux-MIPS <linux-mips@linux-mips.org>
Message-ID: <20091030021614.yujwA_pr93RaZbBbCmOmUxljzl48cc22fmfCgv24FKE@z>

2009/10/29 Wu Zhangjin <wuzhangjin@gmail.com>:
> From: Wu Zhangjin <wuzhangjin@gmail.com>
>
> This patch indents the instructions in the delay slot of the file which
> has a ".set noreorder" added.
>
> and also, the "addu a0, 4" instruction is replaced by "addiu a0, a0, 4".
Hi,

May I ask a question,
what is the difference between "addu a0, 4" and "addiu a0, a0, 4"?
They look same to me.
Thank you.

Regards,
Winfred Lu
