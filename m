Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC320C7EE23
	for <linux-mips@archiver.kernel.org>; Thu,  1 Jun 2023 12:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbjFAM4N (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 1 Jun 2023 08:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233317AbjFAM4K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Jun 2023 08:56:10 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E6D51123;
        Thu,  1 Jun 2023 05:56:08 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 35EAD92009C; Thu,  1 Jun 2023 14:56:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 2EE5E92009B;
        Thu,  1 Jun 2023 13:56:07 +0100 (BST)
Date:   Thu, 1 Jun 2023 13:56:07 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Manuel Lauss <manuel.lauss@gmail.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] MIPS: Fix recent clutter with PATA_PLATFORM
Message-ID: <alpine.DEB.2.21.2306011327300.59991@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

 A recent change has cluttered irrelevant MIPS platforms such as MALTA 
with PATA_PLATFORM configuration question, which makes no sense for them.  
This small patch series addresses the original issue in the correct way.

 See individual change descriptions for details.  Please apply.

  Maciej
