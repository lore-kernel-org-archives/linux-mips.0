Return-Path: <SRS0=DFZS=64=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767E7C433DF
	for <linux-mips@archiver.kernel.org>; Thu, 14 May 2020 13:21:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42BB32065D
	for <linux-mips@archiver.kernel.org>; Thu, 14 May 2020 13:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="LPQULIux"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgENNVJ (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 14 May 2020 09:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726011AbgENNVI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 09:21:08 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7F6C061A0C
        for <linux-mips@vger.kernel.org>; Thu, 14 May 2020 06:21:08 -0700 (PDT)
Received: from flygoat-x1e (unknown [IPv6:240e:e0:f119:2cb7:6296:45e7:5f8f:e5ca])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 9F653204A1;
        Thu, 14 May 2020 13:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1589462468; bh=dt0oMQnLD2dy80InntY+o/viGRveYVeggH/+jIqQpdo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LPQULIuxKLB/R8gDhccOB4Innq/kYwpaUMSQknxuJ+hACcfjRy5JOUc1aMBDts3D8
         WBC5OocR1OQdQdleql8MjJfd2akehjUIcJSsZeBkB8XSEW232hN5nus6tkrSuZIz2v
         i25RDmPogHdJe7NhK4cRpYdzrgI7GZnz/g4g7zlhn2WCAy1GDtl0Pf5rWSGiAlB+Ch
         2IHAovFawsKqds5TWl6YOFsf1O8Y8KcJj/7p95DPIZNniMZw+tfCs2K+vCTsEcYHg0
         0dp6hCxxedw/2obN+kvfnoocjzD/0NfyuaBhyXPUjTZuANTxduf4rH91p1Zk5f+oEy
         AweSFZ+iWUOcw==
Date:   Thu, 14 May 2020 21:20:43 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, tsbogend@alpha.franken.de, john.garry@huawei.com
Subject: Re: [PATCH RESEND v3 2/3] MIPS: Introduce PCI_IO_VMMAP
Message-ID: <20200514212043.4e41a4e7@flygoat-x1e>
In-Reply-To: <20200508114438.3092215-2-jiaxun.yang@flygoat.com>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
        <20200508114438.3092215-1-jiaxun.yang@flygoat.com>
        <20200508114438.3092215-2-jiaxun.yang@flygoat.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri,  8 May 2020 19:44:37 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> Define PCI_IOBASE for MIPS at the strat of kernel mapping segment.
> That would allow virt address of I/O ports to be dynamicly mapped.
> So we'll be able to combine multiple MMIO ranges into I/O ports
> and thus we can take advantage of logic_pio mechanism.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---

Any update?

Thanks.

[...]
--
Jiaxun Yang
