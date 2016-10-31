Received: from mailapp01.imgtec.com ([195.59.15.196]:23699 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993003AbcJaQZHVH7hN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 31 Oct 2016 17:25:07 +0100
Date: Mon, 31 Oct 2016 16:24:53 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 0/4] MIPS I/II FP signal context handling fixes
Message-ID: <alpine.DEB.2.00.1610310319010.31859@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20161031162453.CZrbgSyVVNQvc4o7S8SIEt14PBA_qBjlbSbW1dBs2p8@z>

Hi,

 These fix a bunch of MIPS I/II FP signal context handling issues I have 
discovered while working on the recent FCSR updates.  See individual patch 
descriptions for details.

 Please queue for the upstream merge.

  Maciej
