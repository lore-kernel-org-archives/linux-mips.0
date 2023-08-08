Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1E5C001B0
	for <linux-mips@archiver.kernel.org>; Tue,  8 Aug 2023 16:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbjHHQEV (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbjHHQDC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 12:03:02 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0CB155FFB;
        Tue,  8 Aug 2023 08:44:51 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id A24C49200C4; Tue,  8 Aug 2023 16:54:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id A02FE9200BF;
        Tue,  8 Aug 2023 15:54:41 +0100 (BST)
Date:   Tue, 8 Aug 2023 15:54:41 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH] MIPS: Remove noreturn attribute for die()
In-Reply-To: <1690887599-11442-1-git-send-email-yangtiezhu@loongson.cn>
Message-ID: <alpine.DEB.2.21.2308081544180.38537@angie.orcam.me.uk>
References: <1690887599-11442-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 1 Aug 2023, Tiezhu Yang wrote:

> If notify_die() returns NOTIFY_STOP, there is no need to call
> make_task_dead(), we can remove noreturn attribute for die(),
> this is similar with arm64, riscv and csky.

 So you want to keep a task alive that has caused a kernel oops in the 
process context in this case, right?  What purpose would it be for and 
what condition causes `notify_die' to return NOTIFY_STOP?  IOW why is 
there no need to call `make_task_dead' in this case?

  Maciej
