Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF21C77B72
	for <linux-mips@archiver.kernel.org>; Sat, 15 Apr 2023 00:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjDOAVe (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 14 Apr 2023 20:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDOAVd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Apr 2023 20:21:33 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7606D40F8
        for <linux-mips@vger.kernel.org>; Fri, 14 Apr 2023 17:21:30 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id nTfRpxKEOv5uInTfSp7BlT; Sat, 15 Apr 2023 02:21:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1681518088; bh=9ilePXRoNUCDch556gtjeLIsfgDIoTn3Fmaci6x9Kw0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=oi0iu4XGJWZ7tHkF+Mg9KDiSQaLzb6eMD0uFy5lKUy+LNQ+JssRtUSuXEeBfh8Yu+
         03+BLgiusjG3KN/GrqDP9g+0wsn3jU07TPUr5ZX9MAr39kll6KO6+nIIQ5FoGVNXEH
         1fL2oBJzb1schTPes/MbmchR9YwIqQjf09wo7Ehl4xG7nMpnxWSqyU/NcZ3y6EdPb4
         hNan+hDVcUNTAGIArZiquzlxRSfYh5PBC1uYuNmW5V/qPWVU6DW3kHDRr0uDoOKPlB
         ARdrhoPqssugooP1JlMg0i15y4nxktfQYBSGyW+WG9xnxEOgkIKW9A1KPmKMEIqOfD
         7Yl3+Nu4SoMcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1681518088; bh=9ilePXRoNUCDch556gtjeLIsfgDIoTn3Fmaci6x9Kw0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=oi0iu4XGJWZ7tHkF+Mg9KDiSQaLzb6eMD0uFy5lKUy+LNQ+JssRtUSuXEeBfh8Yu+
         03+BLgiusjG3KN/GrqDP9g+0wsn3jU07TPUr5ZX9MAr39kll6KO6+nIIQ5FoGVNXEH
         1fL2oBJzb1schTPes/MbmchR9YwIqQjf09wo7Ehl4xG7nMpnxWSqyU/NcZ3y6EdPb4
         hNan+hDVcUNTAGIArZiquzlxRSfYh5PBC1uYuNmW5V/qPWVU6DW3kHDRr0uDoOKPlB
         ARdrhoPqssugooP1JlMg0i15y4nxktfQYBSGyW+WG9xnxEOgkIKW9A1KPmKMEIqOfD
         7Yl3+Nu4SoMcA==
Date:   Sat, 15 Apr 2023 02:21:24 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     linux-staging@lists.linux.dev, netdev@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        David Daney <ddaney.cavm@gmail.com>,
        "Steven J. Hill" <sjhill@realitydiluted.com>
Subject: Re: [PATCH 2/3] staging: octeon: avoid needless device allocation
Message-ID: <ZDnuBDruWPFNwvWX@lenoch>
References: <ZDgNexVTEfyGo77d@lenoch>
 <ZDgOLHw1IkmWVU79@lenoch>
 <543bfbb6-af60-4b5d-abf8-0274ab0b713f@lunn.ch>
 <ZDgxPet9RIDC9Oz1@lenoch>
 <e2f5462d-5573-483c-9428-5f2b052cf939@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2f5462d-5573-483c-9428-5f2b052cf939@lunn.ch>
X-CMAE-Envelope: MS4wfHTE2Vck/h8W4fgx8xmu6CI4hbI5QppxWbMKXo3GzPtS6srSky59yVtjcwCpB0HHncUofK13zOD2KvqCZEplxTdeoBqsJbau4wHKuh0ncJwc7pH35w8B
 nTbdLB7c1JGHO89ab2asZ+cdDF2rpRygGdy71uI3KhV9nVpERt5keM3wJAFRbjxBKX2koMLJy8s/lVC6ZoOunOlxCD2WDNbY4in5gKyVtpXMxL40qITirFnv
 954ToH/jss2hpTd2Q6Hkmb/W38gLlAVNd0EJ2+ioXjukGmNZpDZ4JJFxUyygasxTq8lmI5UzkvvRB5f17Te2O5V6PI/xSUddJWfKGp/ZluinM2hGYi2/FVGX
 N0dPC6WBem5NNXjPCfee8fKUBsEUXp9I7Os0IsGFzJd7k0jj8Q8=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+David Daney, Steven J. Hill

On Thu, Apr 13, 2023 at 07:20:08PM +0200, Andrew Lunn wrote:
> > I was asking this question myself and then came to this:
> > Converting driver to phylink makes separating different macs easier as
> > this driver is splitted between staging and arch/mips/cavium-octeon/executive/
> > However I'll provide changes spotted previously as separate preparational
> > patches. Would that work for you?
> 
> Is you end goal to get this out of staging? phylib vs phylink is not a
> reason to keep it in staging.

A side question here: Once upon the time there was an "Cavium OCTEON-III
network driver" patchset floating around, reached v9, at least that's
the last one I was able to find [1]. Prerequisites were intended to go
via linux-mips tree [2].

I was unable to find any further traces and this driver is not even
in Cavium's 5.4 vendor tree. What happened with that? It is for different
hardware, but some design decisions might be interesting here as well.

> It just seems odd to be adding new features to a staging driver. As a
> bit of a "carrot and stick" maybe we should say you cannot add new
> features until it is ready to move out of staging?
> 
> But staging is not my usual domain.
> 
> 	 Andrew

[1] https://www.spinics.net/lists/netdev/msg498700.html
[2] https://www.spinics.net/lists/netdev/msg498696.html
