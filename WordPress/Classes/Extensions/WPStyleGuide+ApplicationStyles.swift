import Foundation
import WordPressShared

extension WPStyleGuide {
    // MARK: - styles used before Muriel colors are enabled
    public class func navigationBarBackgroundImage() -> UIImage {
        return UIImage(color: WPStyleGuide.wordPressBlue())
    }

    public class func navigationBarBarStyle() -> UIBarStyle {
        return .black
    }

    public class func navigationBarShadowImage() -> UIImage {
        return UIImage(color: UIColor(fromHex: 0x007eb1))
    }

    // MARK: - style the navigation appearance using Muriel colors
    class func configureNavigationAppearance() {
        let navigationAppearance = UINavigationBar.appearance()
        navigationAppearance.isTranslucent = false
        navigationAppearance.barTintColor = .navigationBar
        navigationAppearance.barStyle = .black

        let buttonBarAppearance = UIBarButtonItem.appearance()
        buttonBarAppearance.tintColor = .white
        buttonBarAppearance.setTitleTextAttributes([NSAttributedString.Key.font: WPFontManager.systemRegularFont(ofSize: 17.0),
                                                    NSAttributedString.Key.foregroundColor: UIColor.white],
                                                   for: .normal)
        buttonBarAppearance.setTitleTextAttributes([NSAttributedString.Key.font: WPFontManager.systemRegularFont(ofSize: 17.0),
                                                    NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.25)],
                                                   for: .disabled)

    }
}


extension WPStyleGuide {
    @objc(configureColorsForView:andTableView:)
    open class func configureColors(view: UIView?, tableView: UITableView?) {
        configureTableViewColors(view: view)
        configureTableViewColors(tableView: tableView)
    }
    class func configureTableViewColors(view: UIView?) {
        guard let view = view else {
            return
        }
        if !FeatureFlag.murielColors.enabled {
            view.backgroundColor = greyLighten30()
        }
    }
    class func configureTableViewColors(tableView: UITableView?) {
        guard let tableView = tableView else {
            return
        }
        if !FeatureFlag.murielColors.enabled {
            tableView.backgroundView = nil
            tableView.backgroundColor = greyLighten30()
            tableView.separatorColor = greyLighten20()
        }
    }

    class func configureColors(view: UIView, collectionView: UICollectionView) {
        configureTableViewColors(view: view)
        collectionView.backgroundView = nil
        collectionView.backgroundColor = greyLighten30()
    }

    @objc
    class func configureTableViewCell(_ cell: UITableViewCell?) {
        guard let cell = cell else {
            return
        }

        cell.textLabel?.font = tableviewTextFont()
        cell.textLabel?.sizeToFit()
        cell.detailTextLabel?.font = tableviewSubtitleFont()
        cell.detailTextLabel?.sizeToFit()

        if !FeatureFlag.murielColors.enabled {
            cell.textLabel?.textColor = darkGrey()
            cell.detailTextLabel?.textColor = grey()
            cell.imageView?.tintColor = greyLighten10()
        }
    }

    class func configureTableViewSmallSubtitleCell(_ cell: UITableViewCell) {
        configureTableViewColors(view: cell)
        cell.detailTextLabel?.font = subtitleFont()
        if FeatureFlag.murielColors.enabled {
            cell.detailTextLabel?.textColor = .textSubtle
        } else {
            cell.detailTextLabel?.textColor = darkGrey()
        }
    }

    @objc
    class func configureTableViewActionCell(_ cell: UITableViewCell?) {
        guard let cell = cell else {
            return
        }
    }

    @objc
    class func configureTableViewDestructiveActionCell(_ cell: UITableViewCell) {
    }

    @objc
    class func configureTableViewTextCell(_ cell: WPTextFieldTableViewCell) {

    }

    @objc class func configureTableViewSectionHeader(_ header: UIView) {
        guard let header = header as? UITableViewHeaderFooterView else {
            return
        }

    }

    @objc
    class func configureTableViewSectionFooter(_ footer: UIView) {
        guard let footer = footer as? UITableViewHeaderFooterView else {
            return
        }

    }

}
