Return-Path: <SRS0=kbB/=4P=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366CEC3F2C1
	for <linux-mips@archiver.kernel.org>; Thu, 27 Feb 2020 21:16:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13701246A5
	for <linux-mips@archiver.kernel.org>; Thu, 27 Feb 2020 21:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbgB0VQY (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 27 Feb 2020 16:16:24 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:53162 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgB0VQY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 16:16:24 -0500
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23991224AbgB0VQVit99E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Feb 2020 22:16:21 +0100
Date:   Thu, 27 Feb 2020 21:16:21 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-mips@vger.kernel.org
Subject: Re: MIPS Hardware support
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
Message-ID: <alpine.LFD.2.21.2002272106360.3609189@eddie.linux-mips.org>
References: <20200227144910.GA25011@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

 My remote lab was offline until last Fri, which limited my verification 
with the latest kernels.  However I have live hardware of the following 
types and I intend to keep it up to date with Linux, and possibly still 
expand support as time permits:

> DECstations (MACH_DECSTATION)

 Several systems of different types, R3k and R4k-based.

> Loongson-2E/F family of machines (MACH_LOONGSON2EF)

 A pair of Fulong Loongson-2E machines.

> MIPS Malta board (MIPS_MALTA)

 A 5Kc-based (64-bit) Malta machine.

> Sibyte BCM91250A-SWARM (SIBYTE_SWARM)

 One system of this kind.

 I have no idea about current QEMU support, but certainly Malta used to be 
supported with various processor types.

 HTH,

  Maciej
