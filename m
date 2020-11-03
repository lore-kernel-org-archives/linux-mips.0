Return-Path: <SRS0=hJX7=EJ=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A45C2D0A3
	for <linux-mips@archiver.kernel.org>; Tue,  3 Nov 2020 10:15:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD82C2074B
	for <linux-mips@archiver.kernel.org>; Tue,  3 Nov 2020 10:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgKCKPt (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 3 Nov 2020 05:15:49 -0500
Received: from verein.lst.de ([213.95.11.211]:36649 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728095AbgKCKPs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Nov 2020 05:15:48 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id B888C67373; Tue,  3 Nov 2020 11:15:45 +0100 (CET)
Date:   Tue, 3 Nov 2020 11:15:45 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     cernekee@gmail.com, f.fainelli@gmail.com,
        james.quinlan@broadcom.com
Cc:     linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
        bcm-kernel-feedback-list@broadcom.com
Subject: can we switch bmips to the generic dma ranges code
Message-ID: <20201103101545.GA20851@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Florian and others,

now that the generic DMA ranges code landed, can we switch bmips over
to it instead of duplicating the logic?
