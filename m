Received: from mailapp01.imgtec.com ([195.59.15.196]:54096 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008111AbbCEA7uGOj0v (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 5 Mar 2015 01:59:50 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH 13/15] MIPS: csrc-sb1250: Remove FSF mail address from GPL notice
Date: Wed, 4 Mar 2015 16:58:55 -0800
Message-ID: <1425517137-26463-14-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20150305005855.aUPi-HFj4SAvW6RxbzQPubfy0Z2tjFRSJjBZxTc4m2g@z>

This is to make checkpatch.pl happy for the next patch. It would otherwise
say --

ERROR: Do not include the paragraph about writing to the Free Software
Foundation's mailing address from the sample GPL notice. The FSF has
changed addresses in the past, and may do so again. Linux already includes
a copy of the GPL.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kernel/csrc-sb1250.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/kernel/csrc-sb1250.c b/arch/mips/kernel/csrc-sb1250.c
index 6ecb77d..df84836 100644
--- a/arch/mips/kernel/csrc-sb1250.c
+++ b/arch/mips/kernel/csrc-sb1250.c
@@ -10,10 +10,6 @@
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
  */
 #include <linux/clocksource.h>
 
-- 
1.8.5.3
