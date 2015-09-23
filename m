Received: from mailapp01.imgtec.com ([195.59.15.196]:33477 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008670AbbIWOt6YZ5ln (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Sep 2015 16:49:58 +0200
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH 3/6] irqdomain: add struct irq_hwcfg and helper functions
Date: Wed, 23 Sep 2015 15:49:15 +0100
Message-ID: <1443019758-20620-4-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1443019758-20620-1-git-send-email-qais.yousef@imgtec.com>
References: <1443019758-20620-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org, tglx@linutronix.de
Cc: marc.zyngier@arm.com, jason@lakedaemon.net, jiang.liu@linux.intel.com, linux-mips@linux-mips.org, Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20150923144915.dNQ40AdlBrEpA2Dw6nPe32QfBkoAmADqRJmOAUwmab8@z>

struct irq_hwcfg is used to describe hardware IPI setup.
