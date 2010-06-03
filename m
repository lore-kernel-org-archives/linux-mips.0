Received: from mail-fx0-f49.google.com ([209.85.161.49]:34853 "EHLO
        mail-fx0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492641Ab0FCLKc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 3 Jun 2010 13:10:32 +0200
MIME-Version: 1.0
In-Reply-To: <95654e45e2f02133c6334fb147d3e28ef94f2bb0.1275439768.git.wuzhangjin@gmail.com>
References: <95654e45e2f02133c6334fb147d3e28ef94f2bb0.1275439768.git.wuzhangjin@gmail.com>
Date: Thu, 3 Jun 2010 14:10:26 +0300
Message-ID: <AANLkTikKBasnKuS2Ym6fS8Wr17obMnFWSmA2mJxDIrjU@mail.gmail.com>
Subject: Re: [PATCH -queue] MIPS: Move Loongson Makefile parts to their own
        Platform file (cont.)
From: Dmitri Vorobiev <dmitri.vorobiev@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Wu Zhangjin <wuzhangjin@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips <linux-mips@linux-mips.org>
Message-ID: <20100603111026.j804towxT9l9RCmaaZJrj7idSMdJqt5Dw4VuqxL8amo@z>

On Wed, Jun 2, 2010 at 11:53 AM, Wu Zhangjin <wuzhangjin@gmail.com> wrote:
> Hi, Ralf
>
> I have fogotten to remove the -Werror in the Makefiles under loongson/

I'm just curious: why would anyone want to remove -Werror? It's very
useful in most cases, IMO.

Dmitri
