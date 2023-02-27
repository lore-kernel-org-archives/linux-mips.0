Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1846C64ED6
	for <linux-mips@archiver.kernel.org>; Mon, 27 Feb 2023 16:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjB0QtH (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 27 Feb 2023 11:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjB0QtG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 11:49:06 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79ED67D8E
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 08:49:05 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pWggS-0004hw-00; Mon, 27 Feb 2023 17:49:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A2E80C0F03; Mon, 27 Feb 2023 17:48:36 +0100 (CET)
Date:   Mon, 27 Feb 2023 17:48:36 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 2/2] MIPS: cevt-r4k: Offset counter value for clearing
 compare interrupt
Message-ID: <20230227164836.GA17414@alpha.franken.de>
References: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
 <20230225221008.8520-3-jiaxun.yang@flygoat.com>
 <20230226232331.GA9208@alpha.franken.de>
 <579403EF-8E0D-4AC9-9AB1-51CBB433E114@flygoat.com>
 <20230227093126.GA6152@alpha.franken.de>
 <1386E355-383C-464E-9821-34BA8ED4DCE3@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1386E355-383C-464E-9821-34BA8ED4DCE3@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 27, 2023 at 11:44:48AM +0000, Jiaxun Yang wrote:
> > so not seen on real hardware ?
> 
> It was discovered on FPGA and then I tried to debug with simulation to
> reveal what’s going on hardware side.

ic, I think the best fix would be to do a write_c0_compare(cnt - 1).
Subtracting COMPARE_INT_SEEN_TICKS feels like overkill to me.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
